# coding: UTF-8

class SearchController < ApplicationController

  before_filter :store_location

  def index
    if params[:q].blank?
      flash.now.alert = "Debes de indicar un término para la búsqueda"
    else
      posts = if params[:q] =~ /^tag:/
        Post.filter_by_tag(params[:q].split(':').last)
      else
        Post.search(params[:q])
      end
      if params[:from]
        from = Date.parse(params[:from].values.join("/"))
        posts = posts.where("publish_date >= ?", from)
      end
      if params[:to]
        to = Date.parse(params[:to].values.join("/"))
        posts = posts.where("publish_date <= ?", to)
      end
      if params[:categories]
        posts = posts.filter_by_categories(params[:categories])
      end
      unless params[:author].blank?
        posts = posts.filter_by_authors(params[:author])
      end
      @posts = posts.order_by_publish_date.page(params[:page]).per(20)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end
