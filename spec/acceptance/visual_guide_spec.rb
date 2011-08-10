# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Visual Guide', %q{
  In order to have content in my site
  As an administrator
  I want to be able to create and edit posts and view them in the section Visual Guide
} do

  scenario %q{
    Create a new video for abdominales and see it
  } do

    admin = create_admin

    login_as admin

    click "Crear nuevo post"

    fill_post :title => "Cómo ganar estabilidad con la bicicleta",
              :excerpt => "",
              :body => "<p>Este vídeo está pensado para obtener un mejor equilibrio en la bicicleta.</p>",
              :category => "Guía Visual > Abdominales > Nivel 5 - Potencia",
              :tags => "bicicleta,estabilidad,ejercicio",
              :image => File.expand_path("../../support/files/bici.jpg", __FILE__)

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"

    page.should have_css("div.navigation a.selected", :text => "Guía visual")

    page.should have_content("Guía visual de Abdominales")
    page.should have_content("Cómo ganar estabilidad con la bicicleta")
    page.should have_content("Nivel 5 - Potencia")

    current_path.should == "/guia-visual/abdominales/nivel-5-potencia/como-ganar-estabilidad-con-la-bicicleta"
  end

  scenario %q{
    Create a new video for estiramientos and see it
  } do

    admin = create_admin

    login_as admin

    click "Crear nuevo post"

    fill_post :title => "Cómo ganar estabilidad con la bicicleta",
              :excerpt => "",
              :body => "<p>Este vídeo está pensado para obtener un mejor equilibrio en la bicicleta.</p>",
              :category => "Guía Visual > Estiramientos > Cadera",
              :tags => "bicicleta,estabilidad,ejercicio",
              :image => File.expand_path("../../support/files/bici.jpg", __FILE__)

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    click "Pincha aquí para verlo"

    page.should have_css("div.navigation a.selected", :text => "Guía visual")

    page.should have_content("Guía visual de Estiramientos")
    page.should have_content("Cómo ganar estabilidad con la bicicleta")
    page.should have_content("Cadera")

    current_path.should == "/guia-visual/estiramientos/cadera/como-ganar-estabilidad-con-la-bicicleta"
  end

  scenario %q{
    Visit Guía Visual section logged in
  } do
    admin = create_admin

    login_as admin

    1.upto(4) do |i|
      time_travel_to "#{5 - i} days ago"
      create_post :user => admin, :title => "Ejercicios abdominales para programadores ##{i}", :categories => "guia-visual,abdominales,nivel-2-estables"
      sleep 2
      create_post :user => admin, :title => "Ejercicios estiramientos para programadores ##{i}", :categories => "guia-visual,estiramientos,cadera"
      sleep 2
      back_to_the_present
    end
    visit "/guia-visual"

    page.should have_css("div.navigation a.selected", :text => "Guía visual")
    page.should have_content("Guía visual")

    page.should have_css("ul.sections li a.selected", :text => "Abdominales")
    page.should have_css("ul.sections li a", :text => "Estiramientos")
    page.should have_css("ul.sections li a", :text => "Editorial")

    page.all("div.posts.abdominales div.post").size.should == 4
    page.all("div.posts.estiramientos div.post").size.should == 4

    within("div.posts.abdominales") do
      within("div.post:eq(1)") do
        page.should have_content("Abdominales")
        page.should have_css("h3 a", :text => "Ejercicios abdominales para programadores #4")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("div.post:eq(2)") do
        page.should have_content("Abdominales")
        page.should have_css("h3 a", :text => "Ejercicios abdominales para programadores #3")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("div.post:eq(3)") do
        page.should have_content("Abdominales")
        page.should have_css("h3 a", :text => "Ejercicios abdominales para programadores #2")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("div.post:eq(4)") do
        page.should have_content("Abdominales")
        page.should have_css("h3 a", :text => "Ejercicios abdominales para programadores #1")
        page.should have_content("por #{admin.name_and_surname}")
      end
      page.should have_css("a", :text => "ver más vídeos sobre abdominales")
    end

  end

end
