# coding: UTF-8

class BlogPostsController < PostsController

  def index
    @posts = Post.last_blog_posts(4)
    @other_posts = Post.other_blog_posts(:page => params[:page], :per_page => 5, :exclude_ids => @posts.map(&:id))
    respond_to do |format|
      format.html
      format.js   { render "posts/index" }
    end
  end

  def show
    @other_posts = Post.other_blog_posts(:page => params[:page], :per_page => 5, :exclude_ids => [@post.id])
    respond_to do |format|
      format.html
    end
  end

  private

  def set_category
    @categories = ["blog"]
  end

end
