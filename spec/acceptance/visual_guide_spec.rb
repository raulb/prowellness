# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Visual Guide', %q{
  In order to have content in my site
  As an administrator
  I want to be able to create and edit posts and view them in the section Visual Guide
} do

  scenario "Create and view an article in Fitness section" do
    admin = create_admin
    
    login_as admin
    
    click "Crear nuevo post"
    
    fill_in "Título", :with => "Ejercicios para programadores"
    fill_in "Resumen", :with => "<p>En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones.</p>"
    fill_in "Cuerpo", :with => "<p>Es importante cuidarse y realizar ejercicio físico a diario.</p>"
    select("Guía Visual > Editorial", :from => "Categoría")
    fill_in "Tags", :with => "dieta, ejercicio,sedentarios"
    
    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"
    
    page.should have_css("h1", :text => "Ejercicios para programadores")
    page.should have_content "En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones."
    page.should have_content "Es importante cuidarse y realizar ejercicio físico a diario."
    page.should have_content "dieta"
    page.should have_content "ejercicio"
    page.should have_content "sedentarios"
    
    visit "/guia-visual/editorial/ejercicios-para-programadores"
    page.should have_css("h1", :text => "Ejercicios para programadores")

    visit "/articulos/mujer/ejercicios-para-programadores"
    page.should have_content("The page you were looking for doesn't exist.")
    
    visit logout_path
    visit "/guia-visual/editorial/ejercicios-para-programadores"

    page.should have_content("Debes de iniciar sesión para ver esta sección")
  end
  
  pending "Create and view multiple articles in the Articles section" do
  end

end
