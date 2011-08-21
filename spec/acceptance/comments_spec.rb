# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Comments', %q{
  In order to make the users participate
  As an author
  I want the people to comment in my posts
} do

  scenario 'View a post and comment on it' do
    admin = create_user
    post = create_post :title => "Ejercicios para programadores", :categories => "blog", :user => admin

    visit "/blog/#{post.slug}"

    page.should have_content "COMENTARIOS"
    page.should have_content "¿Quieres publicar un comentario?"

    click "¡Regístrate!"

    page.should have_content("Introduce tus datos para registrarte")

    fill_in "nombre de usuario", :with => "ferblape"
    fill_in "email", :with => "ferblape@example.com"
    fill_in "contraseña", :with => "blat123"
    fill_in "confirma contraseña", :with => "blat123"
    click "registrar"

    open_email_for "ferblape@example.com"
    page.should have_content("En unos segundos recibirás un email a ferblape@example.com para que puedas activar tu cuenta")

    click_email_link_matching /confirm/

    visit "/blog/#{post.slug}"

    page.should have_content "Sé la primera persona en realizar un comentario"

    fill_in "comment_text", :with => "No estoy para nada de acuerdo"
    click "publicar comentario"

    within(:css, "div.comment:eq(1)") do
      page.should have_content("No estoy para nada de acuerdo")
    end

    fill_in "comment_text", :with => "Bueno"
    click "publicar comentario"

    fill_in "comment_text", :with => "Mira"
    click "publicar comentario"

    fill_in "comment_text", :with => "No sé"
    click "publicar comentario"

    fill_in "comment_text", :with => "Esto..."
    click "publicar comentario"

    fill_in "comment_text", :with => "Ahí lo dejo"
    click "publicar comentario"

    page.should have_content("1")
    page.should have_content("2")

    within(:css, "div.comment:eq(1)") do
      page.should have_content("Ahí lo dejo")
    end

    click "1"

    within(:css, "div.comment:eq(2)") do
      page.should have_content("Bueno")
    end

    within(:css, "div.comment:eq(3)") do
      page.should have_content("Mira")
    end

  end

end
