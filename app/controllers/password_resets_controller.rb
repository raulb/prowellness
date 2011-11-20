# coding: UTF-8

class PasswordResetsController < ApplicationController

  def create
    if user = User.find_by_email(params[:email])
      user.send_password_reset
      flash[:password_reset_success] = user.email
    else
      flash[:show_password_reset] = true
      flash[:alert] = "El e-mail que has introducido no existe"
    end
    redirect_back_or_default('/') and return
  end

  def edit
    if user = User.find_by_password_reset_token!(params[:id])
      session[:user_id] = user.id
      redirect_to edit_user_path and return
    else
      redirect_to root_path, :flash => {:alert => "El código es inválido. Si has olvidado tu contraseña vuelve a solicitar el cambio"} and return
    end
  end

end
