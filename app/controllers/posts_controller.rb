# coding: UTF-8

class PostsController < ApplicationController

  before_filter :set_category
  before_filter :load_post, :only => :show
  before_filter :store_location

  after_filter :increase_post_visits, :only => [:show]

  def index
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

end
