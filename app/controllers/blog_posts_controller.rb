# coding: UTF-8

class BlogPostsController < PostsController

  private
  
  def set_category
    @categories = ["blog"]
  end

end
