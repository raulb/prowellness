# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Posts administration', %q{
  In order to have content in my site
  As an administrator
  I want to be able to create and edit posts for the different sections
} do

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
    select "Fitness", :from => "Categoría"
    fill_in "Tags", :with => "dieta, ejercicio,sedentarios"
    
    click "Guardar como borrador"
    
    page.should have_content("Post guardado correctamente.")
    click "Pincha aquí para previsualizarlo"
        
    page.should have_css("h1", :text => "Ejercicios para programadores")
    page.should have_content "En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones."
    page.should have_content "Es importante cuidarse y realizar ejercicio físico a diario."
    page.should have_content "dieta"
    page.should have_content "ejercicio"
    page.should have_content "sedentarios"
    
    visit admin_posts_path
    
    page.should have_content "Hay 1 borrador pendiente de editar"
    click "Ejercicios para programadores"
    
    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"
    
    page.should have_css("h1", :text => "Ejercicios para programadores")
    page.should have_content "En estos nuevos tiempos que corren, el ser humano se está volviendo cada vez más sedentario, en especial ciertas profesiones."
    page.should have_content "Es importante cuidarse y realizar ejercicio físico a diario."
    page.should have_content "dieta"
    page.should have_content "ejercicio"
    page.should have_content "sedentarios"
  end

end
