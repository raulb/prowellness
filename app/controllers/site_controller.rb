# coding: UTF-8

class SiteController < ApplicationController

  before_filter :store_location

  def home
    @main_posts = Post.get_last_5_articles
    @posts = Post.filter_by_category('articulos').order_by_publish_date.
                  limit(0).where("id not in (#{@main_posts.map(&:id).join(",")})")
                  
    @last_post = Post.last_blog_posts(1).first
    @last_video_abdominales = Post.get_last_posts_from_guia_visual["abdominales"]
    @last_video_estiramientos = Post.get_last_posts_from_guia_visual["estiramientos"]
  end

  def about
  end

end
