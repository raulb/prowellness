# coding: UTF-8

class ArticlesController < PostsController

  def index
    @main_posts = Post.get_last_5_articles(params[:category])
    if params[:category]
      @posts = Post.get_last_articles(5, @main_posts.map(&:id), params[:category])
      @other_posts = Post.other_articles(6, 10, params[:category])
      render "index_category" and return
    else
      @posts = Post.get_last_articles(2, @main_posts.map(&:id))
      @other_posts = Post.other_articles(6, 13)
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
