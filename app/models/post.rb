# coding: UTF-8

require 'texticle/searchable'

class Post < ActiveRecord::Base

  extend Searchable(:title, :excerpt, :body)

  CATEGORIES = {
    "Artículos > Fitness" => "articulos,fitness",
    "Artículos > Fitness > Ejercicio del mes" => "articulos,fitness,ejercicio-del-mes",
    "Artículos > Mujer" => "articulos,mujer",
    "Artículos > Nutrición" => "articulos,nutricion",
    "Artículos > Mi opinión" => "articulos,mi-opinion",
    "Guía Visual > Editorial" => "guia-visual,editorial",
    "Guía Visual > Dietas" => "guia-visual,dietas",
    "Guía Visual > Planes" => "guia-visual,planes",
    "Guía Visual > Abdominales > Nivel 1 - Activación" => "guia-visual,abdominales,nivel-1-activacion",
    "Guía Visual > Abdominales > Nivel 2 - Estables" => "guia-visual,abdominales,nivel-2-estables",
    "Guía Visual > Abdominales > Nivel 3 - En apoyo" => "guia-visual,abdominales,nivel-3-en-apoyo",
    "Guía Visual > Abdominales > Nivel 4 - Con material" => "guia-visual,abdominales,nivel-4-con-material",
    "Guía Visual > Abdominales > Nivel 5 - Potencia" => "guia-visual,abdominales,nivel-5-potencia",
    "Guía Visual > Estiramientos > Pantorilla" => "guia-visual,estiramientos,pantorilla",
    "Guía Visual > Estiramientos > Músculo" => "guia-visual,estiramientos,musculo",
    "Guía Visual > Estiramientos > Cadera" => "guia-visual,estiramientos,cadera",
    "Guía Visual > Estiramientos > Tronco" => "guia-visual,estiramientos,tronco",
    "Guía Visual > Estiramientos > Pectoral" => "guia-visual,estiramientos,pectoral",
    "Guía Visual > Estiramientos > Dorsal" => "guia-visual,estiramientos,dorsal",
    "Guía Visual > Estiramientos > Hombro" => "guia-visual,estiramientos,hombro",
    "Guía Visual > Estiramientos > Brazo" => "guia-visual,estiramientos,brazo",
    "Guía Visual > Estiramientos > Antebrazo" => "guia-visual,estiramientos,antebrazo",
    "Guía Visual > Dietas" => "guia-visual,dietas",
    "Guía Visual > Planes" => "guia-visual,planes",
    "Blog" => "blog"
  }

  def self.valid_categories
    @valid_categories ||= CATEGORIES.values.map do |v|
      v.split(',')
    end.flatten.sort.uniq
  end

  attr_accessible :title, :excerpt, :body, :state, :tags, :categories, :image

  validates_presence_of :categories, :title, :body, :image

  has_many :comments, :dependent => :destroy, :order => "created_at ASC", :include => :user

  before_create :set_slug
  before_destroy :remove_associated_image

  belongs_to :user

  scope :draft,     where(:state => 0)
  scope :published, where(:state => 1)
  scope :order_by_publish_date, published.order("publish_date DESC")
  scope :last_blog_posts, lambda { |how_many|
    filter_by_category('blog').order_by_publish_date.limit(how_many)
  }
  scope :filter_by_tags, lambda { |tag_name|
    where("? = ANY(tags)", tag_name).order_by_publish_date
  }
  scope :filter_by_category, lambda { |category_name|
    where("? = ANY(categories)", category_name)
  }
  scope :filter_by_categories, lambda { |categories|
    query = []
    categories.each do |k,v|
      if v == "1" && valid_categories.include?(k)
        query << "'#{k.sanitize_sql}' = ANY(categories)"
      end
    end
    where('(' + query.join(" OR ") + ')')
  }
  scope :filter_by_authors, lambda{ |authors|
    users_ids = User.search(authors).select("id").map(&:id)
    unless users_ids.empty?
      where("user_id IN (#{users_ids.join(',')})")
    else
      # FIXME: if no user has been found posts should be empty
      where("id < 0")
    end
  }

  mount_uploader :image, ImageUploader

  def draft?
    state == 0 || state.nil?
  end

  def published?
    state == 1
  end

  def published_in_the_future?
    state == 2
  end

  def published=(value)
    if value == true || value == 1
      write_attribute(:state, 1)
      write_attribute(:publish_date, Time.now) if publish_date.nil?
    else
      write_attribute(:state, 0)
    end
  end

  def unpublish!
    update_attributes(:state => 0)
  end

  def tags=(value)
    processed_tags = value.split(",").map{ |t| t.strip }
    return if processed_tags.empty?
    write_attribute(:tags, '{' + processed_tags.join(',') + '}')
  end

  def tags(options = {})
    default_options = {:limit => 5}
    options = default_options.merge(options)
    raw_tags = read_attribute(:tags)
    raw_tags.blank? ? raw_tags : raw_tags.tr('{}','  ').split(',').map{ |t| t.strip }[0...options[:limit]]
  end

  def categories=(value)
    processed_categories = value.split(",").map{ |t| t.strip }
    return if processed_categories.empty?
    write_attribute(:categories, '{' + processed_categories.join(',') + '}')
  end

  def categories
    raw_categories = read_attribute(:categories)
    raw_categories.blank? ? raw_categories : raw_categories.tr('{}','  ').split(',').map{ |t| t.strip.gsub(/\"/,'')}
  end

  def self.find_by_slug(slug)
    where(:slug => slug).first
  end

  def self.find_by_category_and_slug(category,slug)
    filter_by_category(category).where(:slug => slug).first
  end

  def self.find_by_categories_and_slug(categories,slug)
    raise ArgumentError unless categories.is_a?(Array)
    conditions = filter_by_category(categories[0])
    categories[1..-1].each do |category|
      conditions = conditions.filter_by_category(category)
    end
    if candidate = conditions.where(:slug => slug).first
      return candidate if candidate.categories.size == categories.size
    end
  end

  def self.get_last_5_articles(category = nil)
    filter_by_category(category || 'articulos').order_by_publish_date.limit(5)
  end

  def self.get_last_article(category)
    get_last_articles(1, [-1], category)
  end

  def self.get_last_articles(how_many, exclude_ids, category = nil)
    exclude_ids += [-1]
    unless category
      result = {}
      %W{ fitness mujer nutricion mi-opinion }.each do |category|
        result[category] = filter_by_category(category).
                           where("id not IN (#{exclude_ids.join(',')})").
                           order_by_publish_date.limit(how_many)
      end
      result
    else
      filter_by_category(category).
      where("id not IN (#{exclude_ids.join(',')})").
      order_by_publish_date.limit(how_many)
    end
  end

  def self.other_articles(options = {})
    default_options = {
      :per_page => 5, :page => 1, :exclude_ids => [-1]
    }
    options = default_options.merge(options)
    unless options[:category]
      categories_conditions = %W{ fitness mujer nutricion mi-opinion }.map do |category|
        "('#{category}' = ANY(categories))"
      end.join(" OR ")
      where(categories_conditions).
      where("id not IN (#{options[:exclude_ids].join(',')})").
      order_by_publish_date.page(options[:page]).per(options[:per_page])
    else
      filter_by_category(options[:category]).
      where("id not IN (#{options[:exclude_ids].join(',')})").
      order_by_publish_date.page(options[:page]).per(options[:per_page])
    end
  end

  def self.get_last_videos(how_many)
    result = {}
    %W{ abdominales estiramientos }.each do |category|
      result[category] = filter_by_category(category).
                         order_by_publish_date.limit(how_many)
    end
    result
  end

  def self.other_blog_posts(options = {})
    options[:exclude_ids] = options[:exclude_ids].empty? ? options[:exclude_ids] = [-1] : options[:exclude_ids]
    filter_by_category('blog').
    where("id not IN (#{options[:exclude_ids].join(',')})").
    order_by_publish_date.
    page(options[:page] || 1).per(options[:per_page])
  end

  private

  def set_slug
    write_attribute(:slug, title.parameterize) unless title.blank?
  end

  def remove_associated_image
    remove_image!
  end

end

# == Schema Information
#
# Table name: posts
#
#  id             :integer         not null, primary key
#  title          :string(255)
#  slug           :string(255)
#  excerpt        :text
#  body           :text
#  state          :integer         default(0)
#  publish_date   :datetime
#  user_id        :integer
#  comments_count :integer         default(0)
#  tags           :string
#  categories     :string
#  created_at     :datetime
#  updated_at     :datetime
#  image          :string(255)
#

