# coding: UTF-8

class VisualGuidePostsController < PostsController

  before_filter :visual_guide_login_required

  def index
    if params[:categories]
      if params[:slug]
        load_post
        load_other_posts
        respond_to do |format|
          format.js   { render "posts/index" }
        end
      end
    elsif params[:category]
      posts = Post.filter_by_category(params[:category])
      unless params[:subcategory].blank?
        posts = posts.filter_by_category(params[:subcategory])
      end
      unless params[:q].blank?
        posts = posts.search(params[:q])
      end
      # TODO
      # unless params[:from].blank?
      #   from = Date.parse(params[:from].values.join("/"))
      #   posts = posts.where("publish_date >= ?", from)
      # end
      # unless params[:to].blank?
      #   to = Date.parse(params[:to].values.join("/"))
      #   posts = posts.where("publish_date <= ?", to)
      # end
      @posts = posts.order_by_publish_date.page(params[:page]).per(8)
      respond_to do |format|
        format.html { render "index_category" }
        format.js   { render "posts" }
      end
    else
      @posts = Post.get_last_posts_from_guia_visual(4)
      @books = Book.all
      respond_to do |format|
        format.html
        format.js   { render "posts/index" }
      end
    end
  end

  def show
    load_other_posts
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def load_other_posts
    @other_posts = Post.other_visual_guide_posts({
      :page => params[:page], :exclude_ids => [@post.id],
      :category => @post.categories[1],
    })
  end

  def set_category
    @categories = ["guia-visual"]
    @categories << params[:category] if params[:category]
    @categories << params[:categories].split('/') if params[:categories]
    @categories.flatten!
    if action_name != 'index'
      @category = translate_category(@categories.last)
      @parent_category = translate_category(@categories[1])
    end
  end
end
