class Post < ActiveRecord::Base
  
  attr_accessor :title, :excerpt, :body, :state, :tags, :categories
  
  before_create :set_slug
  
  def draft?
    state == 0 || state.nil?
  end
  
  def published?
    state == 1
  end
  
  def published_in_the_future?
    state == 2
  end
  
  def publish!
    new_attributes = {:state => 1}
    new_attributes.merge!(:publish_date => Time.now) if publish_date.nil?
    update_attributes(new_attributes)
  end
  
  def unpublish!
    update_attributes(:state => 0)
  end
  
  private
  
  def set_slug
    write_attribute(:slug, title.parameterize) unless title.blank?
  end
  
end
