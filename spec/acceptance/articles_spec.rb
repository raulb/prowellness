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

  scenario "Create and view multiple articles in the Articles section" do
    admin = create_admin

    login_as admin

    1.upto(3) do |i|
      time_travel_to "#{4 - i} days ago"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness"
      create_post :user => admin, :title => "Ejercicios mujer para programadores ##{i}", :categories => "articulos,mujer"
      create_post :user => admin, :title => "Ejercicios nutrición para programadores ##{i}", :categories => "articulos,nutricion"
      create_post :user => admin, :title => "Ejercicios mi opinión para programadores ##{i}", :categories => "articulos,mi-opinion"
      back_to_the_present
    end

    visit "/articulos"

    page.should have_content("Artículos")

    page.should have_css("ul.sections li a.selected", :text => "Fitness")
    page.should have_css("ul.sections li a", :text => "Mujer")
    page.should have_css("ul.sections li a", :text => "Nutrición")
    page.should have_css("ul.sections li a", :text => "Mi opinión")

    page.all("div.posts.fitness div.post").size.should == 2
    page.all("div.posts.mujer div.post").size.should == 2
    page.all("div.posts.nutricion div.post").size.should == 2
    page.all("div.posts.mi-opinion div.post").size.should == 2

    within("div.posts.fitness") do
      within("div.post:eq(1)") do
        page.should have_content("Fitness")
        page.should have_css("h3 a", :text => "Ejercicios fitness para programadores #3")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("div.post:eq(2)") do
        page.should have_content("Fitness")
        page.should have_css("h3 a", :text => "Ejercicios fitness para programadores #2")
        page.should have_content("por #{admin.name_and_surname}")
      end

      page.should have_css("a", :text => "ver más artículos de fitness")
    end

    within(:css, "div.others") do
      page.should have_content("Más artículos")
      page.should have_css("li.short_post a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-1']", :text => "Ejercicios fitness para programadores #1")
      page.should have_css("li.short_post a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-1']", :text => "Ejercicios mujer para programadores #1")
      page.should have_css("li.short_post a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-1']", :text => "Ejercicios nutrición para programadores #1")
      page.should have_css("li.short_post a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-1']", :text => "Ejercicios mi opinión para programadores #1")
    end

  end

  scenario "Create and view multiple articles in the Fitness section" do
    admin = create_admin

    login_as admin

    1.upto(6) do |i|
      time_travel_to "#{7 - i} days ago"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness"
      create_post :user => admin, :title => "Ejercicios mujer para programadores ##{i}", :categories => "articulos,mujer"
      back_to_the_present
    end

    visit "/articulos"
    click "ver más artículos de fitness"

    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Fitness")

    page.all("div.post")[0].find("h2").text.should == "Ejercicios fitness para programadores #6"
    page.all("div.post")[1].find("h2").text.should == "Ejercicios fitness para programadores #5"
    page.all("div.post")[2].find("h2").text.should == "Ejercicios fitness para programadores #4"
    page.all("div.post")[3].find("h2").text.should == "Ejercicios fitness para programadores #3"

    within(:css, "div.others") do
      page.should have_content("Más artículos")
      page.should have_css("li.short_post:eq(1) a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-2']", :text => "Ejercicios fitness para programadores #2")
      page.should have_css("li.short_post:eq(2) a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-1']", :text => "Ejercicios fitness para programadores #1")
    end
  end

  scenario "Create and view multiple articles in the Mujer section" do
    admin = create_admin

    login_as admin

    1.upto(6) do |i|
      time_travel_to "#{7 - i} days ago"
      create_post :user => admin, :title => "Ejercicios mujer para programadores ##{i}", :categories => "articulos,mujer"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness"
      back_to_the_present
    end

    visit "/articulos/mujer"

    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Mujer")

    page.all("div.post")[0].find("h2").text.should == "Ejercicios mujer para programadores #6"
    page.all("div.post")[1].find("h2").text.should == "Ejercicios mujer para programadores #5"
    page.all("div.post")[2].find("h2").text.should == "Ejercicios mujer para programadores #4"
    page.all("div.post")[3].find("h2").text.should == "Ejercicios mujer para programadores #3"

    within(:css, "div.others") do
      page.should have_content("Más artículos")
      page.should have_css("li.short_post:eq(1) a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-2']", :text => "Ejercicios mujer para programadores #2")
      page.should have_css("li.short_post:eq(2) a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-1']", :text => "Ejercicios mujer para programadores #1")
    end
  end

  scenario "Create and view multiple articles in the Nutrición section" do
    admin = create_admin

    login_as admin

    1.upto(6) do |i|
      time_travel_to "#{7 - i} days ago"
      create_post :user => admin, :title => "Ejercicios nutrición para programadores ##{i}", :categories => "articulos,nutricion"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness"
      back_to_the_present
    end

    visit "/articulos/nutricion"

    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Nutrición")

    page.all("div.post")[0].find("h2").text.should == "Ejercicios nutrición para programadores #6"
    page.all("div.post")[1].find("h2").text.should == "Ejercicios nutrición para programadores #5"
    page.all("div.post")[2].find("h2").text.should == "Ejercicios nutrición para programadores #4"
    page.all("div.post")[3].find("h2").text.should == "Ejercicios nutrición para programadores #3"

    within(:css, "div.others") do
      page.should have_content("Más artículos")
      page.should have_css("li.short_post:eq(1) a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-2']", :text => "Ejercicios nutrición para programadores #2")
      page.should have_css("li.short_post:eq(2) a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-1']", :text => "Ejercicios nutrición para programadores #1")
    end
  end

  scenario "Create and view multiple articles in the Mi opinión section" do
    admin = create_admin

    login_as admin

    1.upto(6) do |i|
      time_travel_to "#{7 - i} days ago"
      create_post :user => admin, :title => "Ejercicios mi opinión para programadores ##{i}", :categories => "articulos,mi-opinion"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness"
      back_to_the_present
    end

    visit "/articulos/mi-opinion"

    page.should have_css("div.navigation a.selected", :text => "Artículos")
    page.should have_content("Mi opinión")

    page.all("div.post")[0].find("h2").text.should == "Ejercicios mi opinión para programadores #6"
    page.all("div.post")[1].find("h2").text.should == "Ejercicios mi opinión para programadores #5"
    page.all("div.post")[2].find("h2").text.should == "Ejercicios mi opinión para programadores #4"
    page.all("div.post")[3].find("h2").text.should == "Ejercicios mi opinión para programadores #3"

    within(:css, "div.others") do
      page.should have_content("Más artículos")
      page.should have_css("li.short_post:eq(1) a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-2']", :text => "Ejercicios mi opinión para programadores #2")
      page.should have_css("li.short_post:eq(2) a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-1']", :text => "Ejercicios mi opinión para programadores #1")
    end
  end
end
