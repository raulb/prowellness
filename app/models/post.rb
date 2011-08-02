# coding: UTF-8

class Post < ActiveRecord::Base
  
  attr_accessible :title, :excerpt, :body, :state, :tags, :categories
  
  validates_presence_of :categories, :title, :excerpt, :body
  
  before_create :set_slug
  
  belongs_to :user
  
  scope :draft,     where(:state => 0)
  scope :published, where(:state => 1)
  
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
    conditions.where(:slug => slug).first
  end
  
  private
  
  def set_slug
    write_attribute(:slug, title.parameterize) unless title.blank?
  end
  
end
