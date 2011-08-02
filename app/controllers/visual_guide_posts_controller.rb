# coding: UTF-8

class VisualGuidePostsController < PostsController
  
  before_filter :login_required
  
  private
  
  def set_category
    @categories = ["guia-visual"]
  end
end
