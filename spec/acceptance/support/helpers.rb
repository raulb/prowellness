# coding: UTF-8

module HelperMethods
  def click(*args)
    click_link_or_button(*args)
  end
  
  def login_as(user)
    visit login_path
    fill_in "E-mail", :with => user.email
    fill_in "Contraseña", :with => user.email.split('@').first
    click 'Entrar'
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance