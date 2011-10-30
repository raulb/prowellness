class Book < ActiveRecord::Base

  has_many :videos, :dependent => :destroy, :class_name => "BookVideo"

  before_create :set_slug

  private

  def set_slug
    write_attribute(:slug, title.parameterize) unless title.blank?
  end

end


# == Schema Information
#
# Table name: books
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

