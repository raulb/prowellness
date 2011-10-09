# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Blog Posts', %q{
  In order to have content in my site
  As an administrator
  I want to be able to create and edit posts and view them in the section Blog
} do

  pending "Create and view an article in Blog section" do
    admin = create_admin

    login_as admin

    click "Crear nuevo post"

    fill_post :title => "Ejercicios para programadores",
              :excerpt => "<p>En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones.</p>",
              :body => "<p>Es importante cuidarse y realizar ejercicio físico a diario.</p>",
              :category => "Blog",
              :tags => "dieta,ejercicio,sedentarios",
              :image => File.expand_path("../../support/files/bici.jpg", __FILE__)

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"

    visit "/blog/ejercicios-para-programadores"
    page.should have_css("ul li a.selected", :text => "blog")
    page.should have_content("Blog de Domingo Sánchez")
    page.should have_content("Ejercicios para programadores")
    page.should have_content("dieta")
    page.should have_content("ejercicio")
    page.should have_content("sedentarios")

    visit "/articulos/mujer/ejercicios-para-programadores"
    page.should have_content("The page you were looking for doesn't exist.")
  end

  scenario "Create and view multiple articles in the Blog section" do
    admin = create_admin

    1.upto(6) do |i|
      time_travel_to "#{7 - i} days ago"
      post = create_post :title => "Ejercicios para programadores ##{i}", :categories => "blog", :user => admin
      back_to_the_present
    end

    1.upto(10) do |i|
      time_travel_to "#{30 - i} days ago"
      post = create_post :title => "Antiguos ejercicios para programadores ##{i}", :categories => "blog", :user => admin
      back_to_the_present
    end

    visit blog_path

    page.should have_css("ul li a.selected", :text => "blog")
    page.should have_content("Blog de Domingo Sánchez")

    within(:css, "ul.posts.blog") do
      page.should have_css("li.main_post h2 a", :text => "Ejercicios para programadores #6")
      page.should have_css("li:eq(2) h2 a", :text => "Ejercicios para programadores #5")
      page.should have_css("li:eq(3) h2 a", :text => "Ejercicios para programadores #4")
      page.should have_css("li:eq(4) h2 a", :text => "Ejercicios para programadores #3")
    end

    within(:css, "div.others") do
      page.should have_content("Otras entradas en el blog")
      page.should have_css("ul.short_post li:eq(1) a[@href$='/blog/ejercicios-para-programadores-2']", :text => "Ejercicios para programadores #2")
      page.should have_css("ul.short_post li:eq(2) a[@href$='/blog/ejercicios-para-programadores-1']", :text => "Ejercicios para programadores #1")
      page.should have_css("ul.short_post li:eq(3) a[@href$='/blog/antiguos-ejercicios-para-programadores-10']", :text => "Antiguos ejercicios para programadores #10")
      page.should have_css("ul.short_post li:eq(4) a[@href$='/blog/antiguos-ejercicios-para-programadores-9']",  :text => "Antiguos ejercicios para programadores #9")
      page.should have_css("ul.short_post li:eq(5) a[@href$='/blog/antiguos-ejercicios-para-programadores-8']",  :text => "Antiguos ejercicios para programadores #8")
    end

    click "2"

    within(:css, "div.others") do
      page.should have_content("Otras entradas en el blog")
      page.should have_css("ul.short_post li:eq(1) a[@href$='/blog/antiguos-ejercicios-para-programadores-7']",  :text => "Antiguos ejercicios para programadores #7")
      page.should have_css("ul.short_post li:eq(2) a[@href$='/blog/antiguos-ejercicios-para-programadores-6']",  :text => "Antiguos ejercicios para programadores #6")
      page.should have_css("ul.short_post li:eq(3) a[@href$='/blog/antiguos-ejercicios-para-programadores-5']",  :text => "Antiguos ejercicios para programadores #5")
      page.should have_css("ul.short_post li:eq(4) a[@href$='/blog/antiguos-ejercicios-para-programadores-4']",  :text => "Antiguos ejercicios para programadores #4")
      page.should have_css("ul.short_post li:eq(5) a[@href$='/blog/antiguos-ejercicios-para-programadores-3']",  :text => "Antiguos ejercicios para programadores #3")
    end

    click "3"

    within(:css, "div.others") do
      page.should have_content("Otras entradas en el blog")
      page.should have_css("ul.short_post li:eq(1) a[@href$='/blog/antiguos-ejercicios-para-programadores-2']",  :text => "Antiguos ejercicios para programadores #2")
      page.should have_css("ul.short_post li:eq(2) a[@href$='/blog/antiguos-ejercicios-para-programadores-1']",  :text => "Antiguos ejercicios para programadores #1")
    end
  end

  scenario 'Comment a post in the blog section' do
    admin = create_user
    post = create_post :title => "Ejercicios para programadores", :categories => "blog", :user => admin

    visit "/blog/#{post.slug}"

    page.should have_content "COMENTARIOS (0)"
    page.should have_content "Para poder comentar un artículo debes estar registrado"

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
