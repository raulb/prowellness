# coding: UTF-8

class ArticlesController < PostsController

  def index
    if params[:category]
      @main_posts = Post.get_last_article(params[:category])
      @posts = Post.get_last_articles(5, @main_posts.map(&:id), params[:category])
      @other_posts = Post.other_articles(:category => params[:category], :page => params[:page], :exclude_ids => (@main_posts + @posts).map(&:id))
      respond_to do |format|
        format.html { render "index_category" }
        format.js   { render "posts/index" }
      end
    else
      @main_posts = []
      @posts = Post.get_last_articles(5, [-1])
      exclude_ids = @posts.map do |k,v|
        v.map(&:id)
      end.flatten
      @other_posts = Post.other_articles(:page => params[:page], :exclude_ids => exclude_ids)
      respond_to do |format|
        format.html
        format.js   { render "posts/index" }
      end
    end
  end

  def show
    @other_posts = Post.other_articles(:page => params[:page])
  end

  private

  def set_category
    @categories = ["articulos"]
    @categories << params[:category] if params[:category]
    @categories << params[:categories].split('/') if params[:categories]
    @categories.flatten!
    @category = translate_category(@categories.last)
  end

end
