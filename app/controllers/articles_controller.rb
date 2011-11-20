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
    elsif params[:categories] && params[:slug]
      @post = Post.find_by_slug(params[:slug])
      @other_posts = Post.other_articles(:category => @post.categories.last, :page => params[:page], :exclude_ids => [@post.id])
      respond_to do |format|
        format.js   { render "posts/index" }
      end
    else
      @main_posts = Post.get_last_5_articles
      @posts = Post.get_last_articles(3, @main_posts.map(&:id))
      exclude_ids = @posts.map do |k,v|
        v.map(&:id)
      end.flatten + @main_posts.map(&:id)
      @other_posts = Post.other_articles(:page => params[:page], :exclude_ids => exclude_ids)
      respond_to do |format|
        format.html
        format.js   { render "posts/index" }
      end
    end
  end

  def show
    @other_posts = Post.other_articles(:page => params[:page], :category => @post.categories.last)
    respond_to do |format|
      format.html
    end
  end

  def month_exercises
    @main_post = Post.get_last_article("ejercicio-del-mes").first
    @posts = Post.get_last_articles(5, [@main_post.id], "ejercicio-del-mes")
    @other_posts = Post.other_articles(:category => "ejercicio-del-mes", :page => params[:page], :exclude_ids => (@posts + [@main_post]).map(&:id))
    respond_to do |format|
      format.html
      format.js   { render "posts/index" }
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
