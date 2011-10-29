# coding: UTF-8

class Admin::BooksController < ApplicationController
  
  before_filter :admin_required
  
  layout 'admin'
  
  def index
    @books = Book.all
  end

end