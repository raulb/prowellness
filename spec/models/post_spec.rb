# coding: UTF-8

require 'spec_helper'

describe Post do
  context "a new post" do
    let(:post) do
      Post.new :title => "Title", :body => "Body", :excerpt => "Excerpt",
               :categories => "Artículos, Fitness",
               :image => File.open(File.expand_path("../../support/files/bici.jpg", __FILE__))
    end

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
      post1 = Post.new :title => "Title", :excerpt => "Excerpt", :body => "Body",
                       :image => File.open(File.expand_path("../../support/files/bici.jpg", __FILE__))
      post1.categories = "Artículos, Mujer"
      post1.save

      post2 = Post.new :title => "Title", :excerpt => "Excerpt", :body => "Body",
                       :image => File.open(File.expand_path("../../support/files/bici.jpg", __FILE__))
      post2.categories = "Artículos, Fitness"
      post2.save

      Post.find_by_category_and_slug("Mujer", "title").should == post1
      Post.find_by_category_and_slug("Fitness", "title").should == post2
      Post.find_by_category_and_slug("Belleza", "title").should be_nil
    end
  end

  describe "#find_by_categories_and_slug method" do
    it "should find the post in the category and with the slug" do
      post1 = Post.new :title => "Title", :excerpt => "Excerpt", :body => "Body",
                       :image => File.open(File.expand_path("../../support/files/bici.jpg", __FILE__))
      post1.categories = "articulos, Mujer"
      post1.save

      post2 = Post.new :title => "Title", :excerpt => "Excerpt", :body => "Body",
                       :image => File.open(File.expand_path("../../support/files/bici.jpg", __FILE__))
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

  context "an existing post" do
    let(:post){ create_post }

    it "should be destroyed successfully" do
      post.save
      post.reload
      post.destroy
      lambda {
        Post.find(post.id)
      }.should raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context "having losts of posts" do
    before do
      @posts = []
      @fitness = []
      @women = []
      1.upto(6) do |i|
        time_travel_to "#{7 - i} days ago"
        @fitness << create_post(:categories => "articulos,fitness")
        @women   << create_post(:categories => "articulos,mujer")
        @posts   << create_post(:categories => "blog")
        back_to_the_present
      end
    end

    it "should be ordered by publish_date with #order_by_publish_date method" do
      posts = Post.published.order_by_publish_date
      posts.map(&:id)[0..5].should == [18,17,16,15,14,13]
    end

    it "should filter only blog_posts using #last_blog_posts method" do
      Post.last_blog_posts(3).each do |post|
        post.categories.should include("blog")
      end
    end

    it "should get last articles using #get_last_articles method" do
      main_posts = Post.get_last_5_articles
      posts = Post.get_last_articles(2, main_posts.map(&:id))
      posts["fitness"].should_not be_empty
      posts["mujer"].should_not be_empty
      posts["fitness"].each{ |post| post.categories.should include("fitness") }
      posts["mujer"].each{ |post| post.categories.should include("mujer") }
      main_posts.each do |post|
        posts["mujer"].should_not include(post)
        posts["fitness"].should_not include(post)
      end
    end

    it "should get the last five articles, no mather their category" do
      posts = Post.get_last_5_articles
      posts.should include(@fitness.last)
      posts.should include(@women.last)
      posts.should include(@fitness[4])
      posts.should include(@women[4])
    end

    it "should get the last five articles in a category" do
      posts = Post.get_last_5_articles("fitness")
      posts.should include(@fitness.last)
      posts.should include(@fitness[5])
      posts.should include(@fitness[4])
      posts.should include(@fitness[3])
      posts.should include(@fitness[2])
      posts.should include(@fitness[1])
    end

  end
end