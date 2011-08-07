# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Articles', %q{
  In order to have content in my site
  As an administrator
  I want to be able to create and edit posts and view them in the section Articles
} do

  scenario "Create and view an article in Fitness section" do
    admin = create_admin

    login_as admin

    click "Crear nuevo post"

    fill_post :title => "Ejercicios para programadores",
              :excerpt => "<p>En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones.</p>",
              :body => "<p>Es importante cuidarse y realizar ejercicio físico a diario.</p>",
              :category => "Artículos > Fitness",
              :tags => "dieta,ejercicio,sedentarios",
              :image => File.expand_path("../../support/files/bici.jpg", __FILE__)

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"

    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Fitness")
    page.should have_content("Ejercicios para programadores")

    visit "/articulos/fitness/ejercicios-para-programadores"
    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Fitness")
    page.should have_content("Ejercicios para programadores")
    page.should have_content("dieta")
    page.should have_content("ejercicio")
    page.should have_content("sedentarios")

    visit "/articulos/mujer/ejercicios-para-programadores"
    page.should have_content("The page you were looking for doesn't exist.")
  end

  scenario "Create and view an article in Mujer section" do
    admin = create_admin

    login_as admin

    click "Crear nuevo post"

    fill_post :title => "Ejercicios para programadores",
              :excerpt => "<p>En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones.</p>",
              :body => "<p>Es importante cuidarse y realizar ejercicio físico a diario.</p>",
              :category => "Artículos > Mujer",
              :tags => "dieta,ejercicio,sedentarios",
              :image => File.expand_path("../../support/files/bici.jpg", __FILE__)

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"

    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Mujer")
    page.should have_content("Ejercicios para programadores")

    visit "/articulos/mujer/ejercicios-para-programadores"
    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Mujer")
    page.should have_content("Ejercicios para programadores")
    page.should have_content("dieta")
    page.should have_content("ejercicio")
    page.should have_content("sedentarios")

    visit "/articulos/fitness/ejercicios-para-programadores"
    page.should have_content("The page you were looking for doesn't exist.")
  end

  scenario "Create and view an article in Nutrición section" do
    admin = create_admin

    login_as admin

    click "Crear nuevo post"

    fill_post :title => "Ejercicios para programadores",
              :excerpt => "<p>En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones.</p>",
              :body => "<p>Es importante cuidarse y realizar ejercicio físico a diario.</p>",
              :category => "Artículos > Nutrición",
              :tags => "dieta,ejercicio,sedentarios",
              :image => File.expand_path("../../support/files/bici.jpg", __FILE__)

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"

    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Nutrición")
    page.should have_content("Ejercicios para programadores")

    visit "/articulos/nutricion/ejercicios-para-programadores"
    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Nutrición")
    page.should have_content("Ejercicios para programadores")
    page.should have_content("dieta")
    page.should have_content("ejercicio")
    page.should have_content("sedentarios")

    visit "/articulos/fitness/ejercicios-para-programadores"
    page.should have_content("The page you were looking for doesn't exist.")
  end

  scenario "Create and view an article in Mi opinión section" do
    admin = create_admin

    login_as admin

    click "Crear nuevo post"

    fill_post :title => "Ejercicios para programadores",
              :excerpt => "<p>En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones.</p>",
              :body => "<p>Es importante cuidarse y realizar ejercicio físico a diario.</p>",
              :category => "Artículos > Mi opinión",
              :tags => "dieta,ejercicio,sedentarios",
              :image => File.expand_path("../../support/files/bici.jpg", __FILE__)

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"

    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Ejercicios para programadores")
    page.should have_content("Mi opinión")

    visit "/articulos/mi-opinion/ejercicios-para-programadores"
    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Mi opinión")
    page.should have_content("Ejercicios para programadores")
    page.should have_content("dieta")
    page.should have_content("ejercicio")
    page.should have_content("sedentarios")

    visit "/articulos/fitness/ejercicios-para-programadores"
    page.should have_content("The page you were looking for doesn't exist.")
  end

  scenario "Create and view an article in Ejercicio del mes section" do
    admin = create_admin

    login_as admin

    click "Crear nuevo post"

    fill_post :title => "Ejercicios para programadores",
              :excerpt => "<p>En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones.</p>",
              :body => "<p>Es importante cuidarse y realizar ejercicio físico a diario.</p>",
              :category => "Artículos > Fitness > Ejercicio del mes",
              :tags => "dieta,ejercicio,sedentarios",
              :image => File.expand_path("../../support/files/bici.jpg", __FILE__)

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"

    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Ejercicios para programadores")
    page.should have_content("Ejercicio del mes")

    visit "/articulos/fitness/ejercicio-del-mes/ejercicios-para-programadores"
    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Ejercicio del mes")
    page.should have_content("Ejercicios para programadores")
    page.should have_content("dieta")
    page.should have_content("ejercicio")
    page.should have_content("sedentarios")

    visit "/articulos/fitness/ejercicios-para-programadores"
    page.should have_content("The page you were looking for doesn't exist.")
  end

  pending "Create and view multiple articles in the Articles section" do
  end

end
