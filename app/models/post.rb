# coding: UTF-8

class Post < ActiveRecord::Base
  
  attr_accessible :title, :excerpt, :body, :state, :tags, :categories
  
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
    write_attribute(:tags, '{' + processed_tags.join(',') + '}')
  end
  
  def tags
    read_attribute(:tags).tr('{}','  ').split(',').map{ |t| t.strip }
  end
  
  def categories=(value)
    processed_categories = value.split(",").map{ |t| t.strip }
    write_attribute(:categories, '{' + processed_categories.join(',') + '}')
  end
  
  def categories
    read_attribute(:categories).tr('{}','  ').split(',').map{ |t| t.strip }
  end
  
  private
  
  def set_slug
    write_attribute(:slug, title.parameterize) unless title.blank?
  end
  
end
