# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Posts administration', %q{
  In order to have content in my site
  As an administrator
  I want to be able to create and edit posts for the different sections
} do

  scenario 'Manage posts in the administration' do
    admin = create_admin

    time_travel_to(40.minutes.ago) { @post_fitness1 = create_post :user => admin, :categories => "articulos,fitness" }
    time_travel_to(30.minutes.ago) { @post_fitness2 = create_post :user => admin, :categories => "articulos,fitness" }
    time_travel_to(20.minutes.ago) { @post_mujer1   = create_post :user => admin, :categories => "articulos,mujer" }
    time_travel_to(10.minutes.ago) { @post_blog1    = create_post :user => admin, :categories => "blog", :published => false }
    time_travel_to(5.minutes.ago)  { @post_blog2    = create_post :user => admin, :categories => "blog" }

    login_as admin

    within("ul.posts li.post:eq(1)") do
      page.should have_content @post_blog2.title
      page.should have_content "[Publicado]"
      page.should have_content "Cat: blog"
    end

    within("ul.posts li.post:eq(2)") do
      page.should have_content @post_blog1.title
      page.should have_content "[Borrador]"
      page.should have_content "Cat: blog"
    end

    within("ul.posts li.post:eq(3)") do
      page.should have_content @post_mujer1.title
      page.should have_content "[Publicado]"
      page.should have_content "Cat: articulos, mujer"
    end

    within("ul.posts li.post:eq(4)") do
      page.should have_content @post_fitness2.title
      page.should have_content "[Publicado]"
      page.should have_content "Cat: articulos, fitness"
    end

    within("ul.posts li.post:eq(5)") do
      page.should have_content @post_fitness1.title
      page.should have_content "[Publicado]"
      page.should have_content "Cat: articulos, fitness"
    end
  end

  scenario 'Manage posts in the administration when pagination is required' do
    admin = create_admin

    23.times do
      create_post :user => admin
    end

    login_as admin

    page.should have_content "1"
    page.should have_content "2"
    page.should have_content "3"

    page.should have_css("ul.posts li.post:eq(10)")

    click "2"

    page.should have_css("ul.posts li.post:eq(10)")

    click "3"

    page.should have_css("ul.posts li.post:eq(3)")
    page.should_not have_css("ul.posts li.post:eq(4)")
  end

  scenario 'Publish a new post in Fitness section' do
    excerpt = <<-TEXT
<p>En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más
sedentario, en especial ciertas profesiones.</p>
TEXT
    body = <<-TEXT
<p>Es importante cuidarse y realizar ejercicio físico a diario.</p>
TEXT
    admin = create_admin

    visit login_path
    fill_in "E-mail", :with => admin.email
    click 'Entrar'

    page.should have_content("E-mail o contraseña inválidos")

    login_as admin

    click "Crear nuevo post"

    page.should have_content("Nuevo post")

    fill_in "Título", :with => "Ejercicios para programadores"
    fill_in "Resumen", :with => excerpt
    fill_in "Cuerpo", :with => body
    select  "Artículos > Fitness", :from => "Categoría"
    fill_in "Tags", :with => "dieta, ejercicio,sedentarios"
    attach_file "Imagen", File.expand_path("../../support/files/bici.jpg", __FILE__)

    click "Guardar como borrador"

    page.should have_content("Post guardado correctamente.")
    click "Pincha aquí para previsualizarlo"

    page.should have_content "Ejercicios para programadores"
    page.should have_content "En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones."
    page.should have_content "Es importante cuidarse y realizar ejercicio físico a diario."
    page.should have_content "dieta"
    page.should have_content "ejercicio"
    page.should have_content "sedentarios"
    page.should have_css("img")

    visit admin_posts_path

    page.should have_content "Hay 1 borrador pendiente de publicar"
    click "Ejercicios para programadores"

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"

    page.should have_content "Ejercicios para programadores"
    page.should have_content "En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones."
    page.should have_content "Es importante cuidarse y realizar ejercicio físico a diario."
    page.should have_content "dieta"
    page.should have_content "ejercicio"
    page.should have_content "sedentarios"
  end

end
