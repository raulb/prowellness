# coding: UTF-8

class SearchController < ApplicationController
  def index
    if params[:q].blank?
      flash.now.alert = "Debes de indicar un término para la búsqueda"
    else
      posts = Post.search(params[:q])
      if params[:categories]
        posts = posts.filter_by_categories(params[:categories])
      end
      unless params[:author].blank?
        posts = posts.filter_by_authors(params[:author])
      end
      @posts = posts.order_by_publish_date.page(params[:page]).per(50)
    end
  end

end
