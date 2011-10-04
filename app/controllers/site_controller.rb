# coding: UTF-8

class SiteController < ApplicationController

  def home
    @main_posts = Post.get_last_5_articles
    @posts = Post.filter_by_category('articulos').order_by_publish_date.
                  limit(10).where("id not in (#{@main_posts.map(&:id).join(",")})")
    @last_post = Post.last_blog_posts(1).first
  end

  def about
  end

end
