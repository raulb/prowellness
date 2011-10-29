class BookVideo < ActiveRecord::Base
  
  belongs_to :book
  
  validates :code, :presence => true, :uniqueness => true
  validates :video, :presence => true
  
end

# == Schema Information
#
# Table name: book_videos
#
#  id         :integer         not null, primary key
#  code       :string(255)
#  book_id    :integer
#  video      :text
#  created_at :datetime
#  updated_at :datetime
#

