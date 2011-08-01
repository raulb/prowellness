# coding: UTF-8

class ArticlesController < ApplicationController
  
  before_filter :load_post, :only => :show
  
  def index
  end

  def show
  end

end
