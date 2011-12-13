# coding: UTF-8

class Admin::PostsController < ApplicationController
  before_filter :admin_required

  layout 'admin'

  def index
    posts = Post
    unless params[:q].blank?
      if params[:q] =~ /^tag:/
        posts = posts.filter_by_tag(params[:q].split(':').last)
      else
        posts = posts.search(params[:q])
      end
    end
    if params[:from] && !params[:from].values.join("").blank?
      from = Date.parse(params[:from].values.join("/"))
      posts = posts.where("publish_date >= ?", from)
    end
    if params[:to] && !params[:to].values.join("").blank?
      to = Date.parse(params[:to].values.join("/"))
      posts = posts.where("publish_date <= ?", to)
    end
    unless params[:category].blank?
      params[:category].split(",").each do |category|
        posts = posts.filter_by_category(category.strip)
      end
    end
    unless params[:state].blank?
      posts = posts.where(:state => params[:state])
    end
    @posts = posts.order("created_at DESC").page(params[:page]).per(20)
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

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    flash.now[:success] = "Post borrado correctamente"
    redirect_to admin_posts_path
  end

end