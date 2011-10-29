class Book < ActiveRecord::Base
  
  has_many :videos, :dependent => :destroy, :class_name => "BookVideo"
  
end

# == Schema Information
#
# Table name: books
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

