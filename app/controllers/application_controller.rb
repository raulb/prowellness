# coding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?, :post_path
 
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
    @current_user
  end
 
  def logged_in?
    !!current_user
  end
  
  def post_path(post)
    case post.categories.first
      when "Artículos"
        article_path(post.categories[1..-1].map{ |c| c.parameterize }, post.slug)
      when "Guía Visual"
        visual_guide_post_path(post.categories[1..-1].map{ |c| c.parameterize }, post.slug)
      when "Blog"
        blog_post_path(post.slug)
    end
  end
  
  def render_404
    render :file => "public/404.html", :status => 404, :layout => false
  end
  
  protected
  
  def admin_required
    logged_in? && current_user.admin?
  end
  
  def load_post
    @post = Post.find_by_slug(params[:slug])
    if @post.draft? && current_user != @post.user
      render_404 and return false
    end
  end
  
end
