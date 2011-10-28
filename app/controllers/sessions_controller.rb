# coding: UTF-8

class SessionsController < ApplicationController

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_back_or_default('/')
    else
      flash[:show_login] = true
      flash.alert = "E-mail o contraseña inválidos"
      redirect_to :back
    end
  rescue
    redirect_back_or_default('/')
  end

  def destroy
    reset_session
    redirect_back_or_default('/')
  end

end
