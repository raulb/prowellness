# coding: UTF-8

class VisualGuidePostsController < PostsController

  before_filter :visual_guide_login_required

  def index
    @posts = Post.get_last_posts_from_guia_visual(4)
    @books = Book.all
  end

  private

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
