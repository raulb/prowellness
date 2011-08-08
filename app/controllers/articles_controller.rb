# coding: UTF-8

class ArticlesController < PostsController

  def index
    if params[:category]
      @posts = Post.get_last_articles(4, params[:category])
      @other_posts = Post.other_articles(6, 4, params[:category])
      render "index_category" and return
    else
      @posts = Post.get_last_articles(2)
      @other_posts = Post.other_articles(6, 2)
    end
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
