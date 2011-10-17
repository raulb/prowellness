# coding: UTF-8

class Admin::VisualGuideVideosController < ApplicationController
  before_filter :admin_required
  before_filter :load_post, :only => [:edit, :update]

  layout 'admin'

  def index
    @posts = Post.filter_by_category("guia-visual").filter_by_category("editorial").
                  order("created_at DESC").page(params[:page]).per(10)
  end

  def edit
  end

  def update
    if params[:post] && params[:post][:video_code] && !params[:post][:video_code].blank? && @post.update_attribute(:video_code, params[:post][:video_code])
      redirect_to admin_visual_guide_videos_path, :flash => {:notice => "Guía visual actualizada correctamente"}
    else
      flash.alert = if params[:post][:video_code].blank?
        "Ha habido un problema al actualizar la guía visual: el código no puede estar en blanco"
      else
        "Ha habido un problema al actualizar la guía visual: #{@post.errors.full_messages.to_sentence}"
      end
      render "edit"
    end
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end

end