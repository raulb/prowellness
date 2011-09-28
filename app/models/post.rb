# coding: UTF-8

class Post < ActiveRecord::Base

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

  attr_accessible :title, :excerpt, :body, :state, :tags, :categories, :image

  validates_presence_of :categories, :title, :body, :image

  has_many :comments, :dependent => :destroy, :order => "created_at ASC"

  before_create :set_slug
  before_destroy :remove_associated_image

  belongs_to :user

  scope :draft,     where(:state => 0)
  scope :published, where(:state => 1)
  scope :order_by_publish_date, published.order("publish_date DESC")
  scope :last_blog_posts, lambda { |how_many|
    where("? = ANY(categories)", "blog").order_by_publish_date.limit(how_many)
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
    default_options = {:limit => 10}
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
    where("? = ANY(categories)", category).where(:slug => slug).first
  end

  def self.find_by_categories_and_slug(categories,slug)
    raise ArgumentError unless categories.is_a?(Array)
    conditions = where("? = ANY(categories)", categories[0])
    categories[1..-1].each do |category|
      conditions = conditions.where("? = ANY(categories)", category)
    end
    if candidate = conditions.where(:slug => slug).first
      return candidate if candidate.categories.size == categories.size
    end
  end

  def self.get_last_5_articles(category = nil)
    where("? = ANY(categories)", category || 'articulos').order_by_publish_date.limit(5)
  end

  def self.get_last_articles(how_many, exclude_ids, category = nil)
    exclude_ids += [-1]
    unless category
      result = {}
      %W{ fitness mujer nutricion mi-opinion }.each do |category|
        result[category] = where("? = ANY(categories)", category).
                           where("id not IN (#{exclude_ids.join(',')})").
                           order_by_publish_date.limit(how_many)
      end
      result
    else
      where("? = ANY(categories)", category).
      where("id not IN (#{exclude_ids.join(',')})").
      order_by_publish_date.limit(how_many)
    end
  end

  def self.other_articles(limit, offset, category = nil)
    unless category
      categories_conditions = %W{ fitness mujer nutricion mi-opinion }.map do |category|
        "('#{category}' = ANY(categories))"
      end.join(" OR ")
      where(categories_conditions).
      order_by_publish_date.limit(limit).offset(offset)
    else
      where("? = ANY(categories)", category).
      order_by_publish_date.limit(limit).offset(offset)
    end
  end

  def self.get_last_videos(how_many)
    result = {}
    %W{ abdominales estiramientos }.each do |category|
      result[category] = where("? = ANY(categories)", category).
                         order_by_publish_date.limit(how_many)
    end
    result
  end

  def self.other_blog_posts(options = {})
    options[:exclude_ids] = options[:exclude_ids].empty? ? options[:exclude_ids] = [-1] : options[:exclude_ids]
    where("? = ANY(categories)", "blog").
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

