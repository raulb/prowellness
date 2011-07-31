# coding: UTF-8

class SessionsController < ApplicationController
  
  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to admin_posts_path
    else
      flash[:alert] = "E-mail o contraseña inválidos"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
  
end
