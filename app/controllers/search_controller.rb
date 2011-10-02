# coding: UTF-8

class SearchController < ApplicationController
  def index
    if params[:q].blank?
      flash.now.alert = "Debes de indicar un término para la búsqueda"
    else
      @posts = Post.search(params[:q]).page(params[:page]).per(50)
    end
  end

end
