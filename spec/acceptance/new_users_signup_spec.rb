# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'New users signup', %q{
  In order to get more users in the site
  As the owner of the site
  I want new users to be able to signup
} do

  scenario 'Signup and confirm my account' do
    visit "/"

    click "registro"

    page.should have_content("Introduce tus datos para registrarte")

    fill_in "nombre de usuario", :with => "ferblape"
    fill_in "email", :with => "ferblape@example.com"
    fill_in "contraseña", :with => "blat123"
    fill_in "confirma contraseña", :with => "blat123"
    click "registrar"

    open_email_for "ferblape@example.com"
    page.should have_content("En unos segundos recibirás un email a ferblape@example.com para que puedas activar tu cuenta")

    click_email_link_matching /confirm/

    page.should have_content "ferblape"
    page.should have_content("Completa tu perfil o modifica algún dato")

    attach_file "avatar", File.expand_path("../../support/files/avatar.png", __FILE__)
    choose "hombre"
    fill_in "contraseña", :with => "blat321"
    fill_in "confirma contraseña", :with => "blat321"
    click "guardar datos"

    page.should have_content "Tus datos han sido guardados correctamente"
  end

end
