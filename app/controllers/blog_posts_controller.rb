# coding: UTF-8

class BlogPostsController < PostsController

  def index
    @posts = Post.last_blog_posts(4)
    @other_posts = Post.other_blog_posts(10, 4)
  end

  private

  def set_category
    @categories = ["blog"]
  end

end
