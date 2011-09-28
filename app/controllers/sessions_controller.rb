# coding: UTF-8

class SessionsController < ApplicationController

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
    else
      flash.now.alert = "E-mail o contraseña inválidos"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
