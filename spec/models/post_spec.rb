# coding: UTF-8

require 'spec_helper'

describe Post do
  context "a new post" do
    let(:post){ Post.new }
    
    it "support HTML in its body" do
      post.body = "<p>This is the <em>body</em></p>"
      post.save
      
      post.body.should == "<p>This is the <em>body</em></p>"
    end
    
    it "support HTML in its excerpt" do
      post.excerpt = "<p>This is the excerpt</p>"
      post.save
      
      post.excerpt.should == "<p>This is the excerpt</p>"
    end
    
    it "has many tags" do
      post.tags = "training, diet, expertise"
      post.save
      post.reload
      post.tags.size.should == 3
      post.tags.should include("training")
      post.tags.should include("diet")
      post.tags.should include("expertise")
      
      post.tags = "running"
      post.save
      post.reload
      post.tags.size.should == 1
      post.tags.should include("running")
    end
    
    pending "has many categories" do
    end
    
    it "is a draft by default" do
      post.should be_draft
      post.should_not be_published
    end
    
    it "can be published" do
      post.published = true
      post.save
      post.reload
      post.publish_date.should_not be_nil
      post.should be_published
      post.should_not be_draft
    end
    
    it "does not change the publish_date value even when have been published more than once" do
      post.published = true
      post.save
      post.reload
      old_publish_date = post.publish_date
      
      jump 30.minutes
      post.published = false
      post.save
      post.published = true
      post.reload
      post.publish_date.should == old_publish_date
    end
    
    it "can be found by its slug" do
      post.title = "This is my first post"
      post.save
      post.reload
      post.slug.should == "this-is-my-first-post"
    end
    
    it "has 0 comments by default" do
      post.comments_count.should == 0
    end
  end
end
