# coding: UTF-8

class BookVideosController < ApplicationController
  
  before_filter :visual_guide_login_required
  
  def index
    @book = Book.first
  end
  
  def show
    @book = Book.first
    unless @book_video = @book.videos.where(:code => params[:code]).first
      redirect_to visual_guide_editorial_path, :flash => {:alert => "El código introducido no corresponde a ningún vídeo"}
    end
  end
  
end