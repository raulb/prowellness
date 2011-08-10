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

  def fill_post(attributes)
    fill_in "Título", :with => attributes[:title]
    fill_in "Resumen", :with => attributes[:excerpt] || String.random(10)
    fill_in "Cuerpo", :with => attributes[:body] || String.random(10)
    select(attributes[:category], :from => "Categoría")
    fill_in "Tags", :with => attributes[:tags] || [String.random(5), String.random(5), String.random(5)].join(',')
    attach_file "Imagen", attributes[:image] || File.expand_path("../../../support/files/bici.jpg", __FILE__)
  end

  def current_path
    URI.parse(current_url).path
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance