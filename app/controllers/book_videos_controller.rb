# coding: UTF-8

class BookVideosController < ApplicationController

  before_filter :visual_guide_login_required

  def index
    @books = Book.all
  end

  def show
    @books = Book.all
    unless @book_video = BookVideo.where(:code => params[:code]).first
      redirect_to visual_guide_editorial_path, :flash => {:alert => "El código introducido no corresponde a ningún vídeo"} and return
    end
    @book = @book_video.book
    respond_to do |format|
      format.html
      format.js
    end
  end

end