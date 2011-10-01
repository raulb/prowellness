# coding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?, :post_path, :translate_category

  before_filter :authenticate

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
    @current_user
  rescue ActiveRecord::RecordNotFound
    @current_user = nil
  end

  def logged_in?
    !!current_user
  end

  def post_path(post)
    case post.categories.first
      when "articulos"
        article_path(post.categories[1..-1].join('/'), post.slug)
      when "guia-visual"
        visual_guide_post_path(post.categories[1..-1].join('/'), post.slug)
      when "blog"
        blog_post_path(post.slug)
    end
  end

  def render_404
    render :file => "public/404.html", :status => 404, :layout => false
  end

  def translate_category(category_sanitized)
    return "" if  category_sanitized.blank?
    Post::CATEGORIES.invert.each do |k,v|
      if k.include?(category_sanitized)
        position = k.split(',').index(category_sanitized)
        return v.split(' > ')[position]
      end
    end
  end

  protected

  def authenticate
    return true unless Rails.env.production?
    authenticate_or_request_with_http_digest do |username|
      ENV['PROWELLNESS_PASSWORD']
    end
  end

  def admin_required
    logged_in? && current_user.admin?
  end

  def login_required
    return true if logged_in?
    redirect_to root_path, :flash => {:alert => "Debes de iniciar sesión para ver esta sección"} and return false
  end

  def load_post
    @post = if @categories
      Post.find_by_categories_and_slug(@categories, params[:slug])
    else
      Post.find_by_slug(params[:slug])
    end
    if @post.nil? || (@post.draft? && current_user != @post.user)
      render_404 and return false
    end
    @other_posts = Post.other_blog_posts(:page => params[:page], :per_page => 5, :exclude_ids => [@post.id])
    @comments = @post.comments.page(params[:comments_page])
  end

end
