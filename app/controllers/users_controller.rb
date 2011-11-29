# coding: UTF-8

class UsersController < ApplicationController

  before_filter :login_required, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to root_path, :flash => {:modal_signup => {:login => @user.login, :email => @user.email}}
    else
      render "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user]
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
    end
    if @user.update_attributes(params[:user])
      flash[:notice] = "Tus datos han sido guardados correctamente"
    else
      flash[:alert] = "Probablemente te falte algún dato obligatorio"
    end
    render "edit"
  end

  def confirm
    render_404 and return if params[:confirmation_token].nil?
    if user = User.where(:confirmation_token => params[:confirmation_token]).first
      user.activate!
      session[:user_id] = user.id
      redirect_to edit_user_path, :flash => {:success => "Tu cuenta ha sido activada correctamente"}
    else
      redirect_to root_path, :flash => {:alert => "Código de activación de cuenta inválido"}
    end
  end

end
