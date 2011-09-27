# coding: UTF-8

class Comment < ActiveRecord::Base

  paginates_per 5

  attr_protected :post_id, :user_id, :ip, :created_at

  belongs_to :post
  belongs_to :user

  validates :text, :presence => true, :length => { :maximum => 500, :minimum => 2 }

end

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  post_id    :integer
#  user_id    :integer
#  text       :text
#  created_at :datetime
#

