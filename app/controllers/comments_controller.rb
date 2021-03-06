# coding: UTF-8

class CommentsController < ApplicationController

  before_filter :load_post, :only => [:index]

  def index
    respond_to do |format|
      format.js
    end
  end

  def create
    @post = Post.find(params[:comment].delete(:post_id))
    @comment = @post.comments.new params[:comment]
    @comment.user = current_user
    @comment.save
    @post.reload
    @comments = @post.comments.page(@post.comments.page(1).num_pages)
    respond_to do |format|
      format.js do
        render "index"
      end
    end
  end

end
