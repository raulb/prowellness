# coding: UTF-8

class SessionsController < ApplicationController

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      @post = Post.find(params[:post_id])
    else
      flash.now.alert = "E-mail o contraseña inválidos"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    reset_session
    redirect_to redirect_back_or_default('/')
  end

end
