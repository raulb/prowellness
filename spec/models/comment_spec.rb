# coding: UTF-8

require 'spec_helper'

describe Comment do
  before do
    @user = create_user
    @post = Post.new :title => "Title", :body => "Body", :excerpt => "Excerpt",
                     :categories => "Artículos, Fitness",
                     :image => File.open(File.expand_path("../../support/files/bici.jpg", __FILE__))
    @post.save
  end

  it "requires a text" do
    comment = @post.comments.new
    comment.should_not be_valid
    comment.errors[:text].should_not be_empty
  end

  it "is related to a user" do
    comment = @post.comments.new :text => "This is my comment!"
    comment.user = @user
    comment.save
    comment.should be_valid
    comment.user.should == @user
    comment.post.should == @post
  end

  it "should update the counter_cache of the post" do
    comment = @post.comments.new :text => "This is my comment!"
    comment.user = @user
    comment.save
    @post.reload
    @post.comments_count.should == 1
  end
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

