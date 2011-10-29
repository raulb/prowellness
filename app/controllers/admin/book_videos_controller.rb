# coding: UTF-8

class Admin::BookVideosController < ApplicationController
  
  before_filter :admin_required, :load_book
  before_filter :load_book_video, :only => [:edit, :update, :destroy]
  
  layout 'admin'
  
  def index
    @book_videos = @book.videos.all
  end
  
  def new
    @book_video = @book.videos.new
  end
  
  def create
    @book_video = @book.videos.new(params[:book_video])
    if @book_video.save
      flash.notice = "Vídeo creado correctamente"
      redirect_to admin_book_book_videos_path(@book) and return
    else
      flash.now.alert = "No se ha podido guardar el vídeo por los siguientes errores: #{@book_video.errors.full_messages.to_sentence}"
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @book_video.update_attributes(params[:book_video])
      flash.notice = "Vídeo actualizado correctamente"
      redirect_to admin_book_book_videos_path(@book) and return
    else
      flash.now.alert = "No se ha podido guardar el vídeo por los siguientes errores: #{@book_video.errors.full_messages.to_sentence}"
      render "edit"
    end
  end
  
  def destroy
    @book_video.destroy
    flash.notice = "Vídeo borrado correctamente"
    redirect_to admin_book_book_videos_path(@book) and return
  end
  
  protected
  
  def load_book
    @book = Book.find(params[:book_id])
  rescue ActiveRecord::RecordNotFound
    render_404 and return false
  end
  
  def load_book_video
    @book_video = @book.videos.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to admin_book_book_videos_path(@book), :flash => {:alert => "No hemos encontrado el vídeo"} and return
  end
  
end