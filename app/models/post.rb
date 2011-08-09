# coding: UTF-8

class Post < ActiveRecord::Base

  CATEGORIES = {
    "Artículos > Fitness" => "articulos,fitness",
    "Artículos > Fitness > Ejercicio del mes" => "articulos,fitness,ejercicio-del-mes",
    "Artículos > Mujer" => "articulos,mujer",
    "Artículos > Nutrición" => "articulos,nutricion",
    "Artículos > Mi opinión" => "articulos,mi-opinion",
    "Guía Visual > Editorial" => "guia-visual,editorial",
    "Guía Visual > Abdominales" => "guia-visual,abdominales",
    "Guía Visual > Estiramientos" => "guia-visual,estiramientos",
    "Guía Visual > Dietas" => "guia-visual,dietas",
    "Guía Visual > Planes" => "guia-visual,planes",
    "Blog" => "blog"
  }

  attr_accessible :title, :excerpt, :body, :state, :tags, :categories, :image

  validates_presence_of :categories, :title, :excerpt, :body, :image

  before_create :set_slug
  before_destroy :remove_associated_image

  belongs_to :user

  scope :draft,     where(:state => 0)
  scope :published, where(:state => 1)
  scope :order_by_publish_date, order("publish_date DESC")
  scope :last_blog_posts, lambda { |how_many|
    where("? = ANY(categories)", "blog").published.order_by_publish_date.limit(how_many)
  }
  scope :other_blog_posts, lambda { |how_many, offset|
    where("? = ANY(categories)", "blog").published.order_by_publish_date.limit(how_many).offset(offset)
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

  def tags
    raw_tags = read_attribute(:tags)
    raw_tags.blank? ? raw_tags : raw_tags.tr('{}','  ').split(',').map{ |t| t.strip }
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
    where("? = ANY(categories)", category || 'articulos').published.order_by_publish_date.limit(5)
  end

  def self.get_last_articles(how_many, exclude_ids, category = nil)
    unless category
      result = {}
      %W{ fitness mujer nutricion mi-opinion }.each do |category|
        result[category] = where("? = ANY(categories)", category).
                           where("id not IN (#{exclude_ids.join(',')})").
                           published.order_by_publish_date.limit(how_many)
      end
      result
    else
      where("? = ANY(categories)", category).published.
      where("id not IN (#{exclude_ids.join(',')})").
      order_by_publish_date.limit(how_many)
    end
  end

  def self.other_articles(limit, offset, category = nil)
    unless category
      categories_conditions = %W{ fitness mujer nutricion mi-opinion }.map do |category|
        "('#{category}' = ANY(categories))"
      end.join(" OR ")
      where(categories_conditions).published.
      order_by_publish_date.limit(limit).offset(offset)
    else
      where("? = ANY(categories)", category).
      published.order_by_publish_date.limit(limit).offset(offset)
    end
  end

  private

  def set_slug
    write_attribute(:slug, title.parameterize) unless title.blank?
  end

  def remove_associated_image
    remove_image!
  end

end
