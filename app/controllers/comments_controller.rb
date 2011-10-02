# coding: UTF-8

class CommentsController < ApplicationController

  before_filter :load_post_and_comments, :only => [:index]

  def index
    respond_to do |format|
      format.js
    end
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.new params[:comment]
    @comment.user = current_user
    success = @comment.save
    @comments = @post.comments.page(@post.comments.page(1).num_pages)
    respond_to do |format|
      format.js do
        render "index"
      end
    end
  end

end
