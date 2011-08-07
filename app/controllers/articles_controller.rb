# coding: UTF-8

class ArticlesController < PostsController

  private

  def set_category
    @categories = ["articulos"]
    @categories << params[:category]   if params[:category]
    @categories << params[:categories].split('/') if params[:categories]
    @categories.flatten!
    @category = translate_category(@categories.last)
  end

end
