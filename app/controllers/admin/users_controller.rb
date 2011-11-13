# coding: UTF-8

class Admin::UsersController < ApplicationController

  layout 'admin'

  before_filter :admin_required
  before_filter :load_user, :except => [:index]

  def index
    unless params[:q].blank?
      users = User.search(params[:q])
    else
      users = User
    end
    @users = users.page(params[:page]).order("created_at DESC").per(20)
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash.notice = "Usuario actualizado correctamente"
      redirect_to admin_users_path and return
    else
      flash.now.alert = "Hubo un problema al actualizar el usuario: #{@user.errors.full_messages.to_sentence}"
      render "edit"
    end
  end

  def destroy
    @user.destroy
    flash.notice = "Usuario eliminado correctamente"
    redirect_to admin_users_path and return
  end

  protected

  def load_user
    @user = User.find(params[:id])
  end

end