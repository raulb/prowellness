# coding: UTF-8

class ArticlesController < PostsController

  private
  
  def set_category
    @categories = ["articulos"]
    @categories << params[:category]   if params[:category]
    @categories << params[:categories] if params[:categories]
  end

end
