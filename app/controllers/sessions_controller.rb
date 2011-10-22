# coding: UTF-8

class SessionsController < ApplicationController

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      @post = Post.find(params[:post_id]) unless params[:post_id].blank?
    else
      flash[:show_login] = true
      flash.alert = "E-mail o contraseña inválidos"
    end
    respond_to do |format|
      format.html do
        if logged_in?
          redirect_back_or_default('/')
        else
          redirect_to :back
        end
      end
    end
  rescue
    redirect_back_or_default('/')
  end

  def destroy
    reset_session
    redirect_back_or_default('/')
  end

end
