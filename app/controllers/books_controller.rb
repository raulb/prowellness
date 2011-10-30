# coding: UTF-8

class BooksController < ApplicationController

  before_filter :store_location

  def index
  end

  def show
    @book = Book.find_by_slug(params[:id])
  end

  def buy
    if @book = Book.find_by_id(params[:id])
      if params[:email].blank? || params[:email] !~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
        flash.alert = "Por favor, introduce un e-mail válido"
      elsif  params[:text].blank?
        flash.alert = "Por favor, introduce tus datos personales"
      else
        UserMailer.buy_notification(@book, params[:email], params[:text]).deliver
        flash.notice = "El pedido se ha enviado correctamente"
      end
      redirect_to buy_book_path(@book.slug) and return
    else
      redirect_to books_path, :flash => {:alert => "El libro que intentas comprar no existe"} and return
    end
  end

end
