# coding: UTF-8

class Admin::PostsController < ApplicationController
  before_filter :admin_required
  
  layout 'admin'
  
  def index
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find params[:id]
  end
  
  def update
    @post = Post.find params[:id]
    @post.update_attributes params[:post]
    @post.published = !params[:publish].nil?
    if @post.save
      if @post.draft?
        flash[:success] = "Post guardado correctamente. <a href=\"#{post_path(@post)}\">Pincha aquí para previsualizarlo</a>".html_safe
      elsif @post.published?
        flash[:success] = "El post ha sido publicado correctamente. <a href=\"#{post_path(@post)}\">Pincha aquí para verlo</a>".html_safe
      end
    else
      flash[:alert] = "El post no se ha podido guardar"
    end
    render "new"
  end
  
  def create
    @post = Post.new params[:post]
    @post.user = current_user
    @post.published = !params[:publish].nil?
    if @post.save
      if @post.draft?
        flash[:success] = "Post guardado correctamente. <a href=\"#{post_path(@post)}\">Pincha aquí para previsualizarlo</a>".html_safe
      elsif @post.published?
        flash[:success] = "El post ha sido publicado correctamente. <a href=\"#{post_path(@post)}\">Pincha aquí para verlo</a>".html_safe
      end
    else
      flash[:alert] = "El post no se ha podido guardar"
    end
    render "new"
  end
  
end