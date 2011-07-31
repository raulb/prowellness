# coding: UTF-8

class PostsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    if @post.draft? && current_user != @post.user
      render_404 and return
    end
  end
  
end