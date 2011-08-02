# coding: UTF-8

class PostsController < ApplicationController

  before_filter :set_category
  before_filter :load_post, :only => :show

  def index
  end

  def show
  end

end
