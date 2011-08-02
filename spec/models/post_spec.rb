# coding: UTF-8

require 'spec_helper'

describe Post do
  context "a new post" do
    let(:post){ Post.new :title => "Title", :body => "Body", :excerpt => "Excerpt", :categories => "Artículos, Fitness" }
    
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
    
    it "has many categories" do
      post.categories = "{Fitness,ejercicio del mes}"
      post.save
      post.reload
      post.categories.size.should == 2
      post.categories.should include("Fitness")
      post.categories.should include("ejercicio del mes")
      
      post.categories = "ejercicio del mes"
      post.save
      post.reload
      post.categories.size.should == 1
      post.categories.should include("ejercicio del mes")
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
  
  describe "#find_by_category_and_slug method" do
    it "should find the post in the category and with the slug" do
      post1 = Post.new :title => "Title", :excerpt => "Excerpt", :body => "Body"
      post1.categories = "Artículos, Mujer"
      post1.save
      
      post2 = Post.new :title => "Title", :excerpt => "Excerpt", :body => "Body"
      post2.categories = "Artículos, Fitness"
      post2.save

      Post.find_by_category_and_slug("Mujer", "title").should == post1
      Post.find_by_category_and_slug("Fitness", "title").should == post2
      Post.find_by_category_and_slug("Belleza", "title").should be_nil
    end
  end
  
  describe "#find_by_categories_and_slug method" do
    it "should find the post in the category and with the slug" do
      post1 = Post.new :title => "Title", :excerpt => "Excerpt", :body => "Body"
      post1.categories = "articulos, Mujer"
      post1.save
      
      post2 = Post.new :title => "Title", :excerpt => "Excerpt", :body => "Body"
      post2.categories = "articulos, Fitness"
      post2.save

      lambda {
        Post.find_by_categories_and_slug("Mujer", "title")
      }.should raise_error
      Post.find_by_categories_and_slug(["articulos","Mujer"], "title").should == post1
      Post.find_by_categories_and_slug(["articulos","Mujer"].reverse, "title").should == post1
      Post.find_by_categories_and_slug(["articulos","Fitness"], "title").should == post2
    end
  end
end