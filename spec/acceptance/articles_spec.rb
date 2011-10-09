# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Articles', %q{
  In order to have content in my site
  As an administrator
  I want to be able to create and edit posts and view them in the section Articles
} do

  pending "Create and view an article in Fitness section" do
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

  pending "Create and view an article in Mujer section" do
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

  pending "Create and view an article in Nutrición section" do
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

  pending "Create and view an article in Mi opinión section" do
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

  pending "Create and view an article in Ejercicio del mes section" do
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

    1.upto(4) do |i|
      time_travel_to "#{5 - i} days ago"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness"
      sleep 2
      create_post :user => admin, :title => "Ejercicios mujer para programadores ##{i}", :categories => "articulos,mujer"
      sleep 2
      create_post :user => admin, :title => "Ejercicios nutrición para programadores ##{i}", :categories => "articulos,nutricion"
      sleep 2
      create_post :user => admin, :title => "Ejercicios mi opinión para programadores ##{i}", :categories => "articulos,mi-opinion"
      back_to_the_present
    end

    visit "/articulos"

    page.should have_content("Artículos")

    page.should have_css("ul li a", :text => "fitness")
    page.should have_css("ul li a", :text => "mujer")
    page.should have_css("ul li a", :text => "nutrición")
    page.should have_css("ul li a", :text => "mi opinión")

    page.all("div.main_post a img").size.should == 5

    page.all("ul.posts.fitness li.post").size.should == 3
    page.all("ul.posts.mujer li.post").size.should == 3
    page.all("ul.posts.nutricion li.post").size.should == 3
    page.all("ul.posts.mi-opinion li.post").size.should == 2

    within("div.main_post") do
      page.should have_css("a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-4']:eq(1)")
      page.should have_css("a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-4']:eq(2)")
      page.should have_css("a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-4']:eq(3)")
      page.should have_css("a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-4']:eq(4)")
      page.should have_css("a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-3']:eq(5)")
    end

    within("ul.posts.fitness") do
      within("li.post:eq(1)") do
        page.should have_css("h2 a", :text => "Ejercicios fitness para programadores #3")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("li.post:eq(2)") do
        page.should have_css("h2 a", :text => "Ejercicios fitness para programadores #2")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("li.post:eq(3)") do
        page.should have_css("h2 a", :text => "Ejercicios fitness para programadores #1")
        page.should have_content("por #{admin.name_and_surname}")
      end
      page.should have_css("a", :text => "ver más artículos de fitness")
    end

    within("ul.posts.mujer") do
      within("li.post:eq(1)") do
        page.should have_css("h2 a", :text => "Ejercicios mujer para programadores #3")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("li.post:eq(2)") do
        page.should have_css("h2 a", :text => "Ejercicios mujer para programadores #2")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("li.post:eq(3)") do
        page.should have_css("h2 a", :text => "Ejercicios mujer para programadores #1")
        page.should have_content("por #{admin.name_and_surname}")
      end
      page.should have_css("a", :text => "ver más artículos de mujer")
    end

    within("ul.posts.nutricion") do
      within("li.post:eq(1)") do
        page.should have_css("h2 a", :text => "Ejercicios nutrición para programadores #3")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("li.post:eq(2)") do
        page.should have_css("h2 a", :text => "Ejercicios nutrición para programadores #2")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("li.post:eq(3)") do
        page.should have_css("h2 a", :text => "Ejercicios nutrición para programadores #1")
        page.should have_content("por #{admin.name_and_surname}")
      end
      page.should have_css("a", :text => "ver más artículos de nutrición")
    end

    within("ul.posts.mi-opinion") do
      within("li.post:eq(1)") do
        page.should have_css("h2 a", :text => "Ejercicios mi opinión para programadores #2")
        page.should have_content("por #{admin.name_and_surname}")
      end
      within("li.post:eq(2)") do
        page.should have_css("h2 a", :text => "Ejercicios mi opinión para programadores #1")
        page.should have_content("por #{admin.name_and_surname}")
      end
      page.should have_css("a", :text => "ver más artículos de mi opinión")
    end
  end

  scenario "Create and view multiple articles in the Fitness section" do
    admin = create_admin

    1.upto(12) do |i|
      time_travel_to "#{13 - i} days ago"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness"
      create_post :user => admin, :title => "Ejercicios mujer para programadores ##{i}", :categories => "articulos,mujer" if(i%3==0)
      back_to_the_present
    end

    visit "/articulos/fitness"

    page.should have_content("Fitness")

    within("div.main_post") do
      page.should have_css("a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-12']:eq(1)")
    end

    within("ul.posts") do
      within("li.post:eq(1)") do
        page.should have_css("h2 a", :text => "Ejercicios fitness para programadores #11")
      end
      within("li.post:eq(2)") do
        page.should have_css("h2 a", :text => "Ejercicios fitness para programadores #10")
      end
      within("li.post:eq(3)") do
        page.should have_css("h2 a", :text => "Ejercicios fitness para programadores #9")
      end
      within("li.post:eq(4)") do
        page.should have_css("h2 a", :text => "Ejercicios fitness para programadores #8")
      end
      within("li.post:eq(5)") do
        page.should have_css("h2 a", :text => "Ejercicios fitness para programadores #7")
      end
    end

    within(:css, "div.others") do
      page.should have_content("Otros artículos de Fitness")
      page.should have_css("ul.short_post li:eq(1) h4 a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-6']", :text => "Ejercicios fitness para programadores #6")
      page.should have_css("ul.short_post li:eq(2) h4 a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-5']", :text => "Ejercicios fitness para programadores #5")
      page.should have_css("ul.short_post li:eq(3) h4 a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-4']", :text => "Ejercicios fitness para programadores #4")
      page.should have_css("ul.short_post li:eq(4) h4 a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-3']", :text => "Ejercicios fitness para programadores #3")
      page.should have_css("ul.short_post li:eq(5) h4 a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-2']", :text => "Ejercicios fitness para programadores #2")
    end

    click "2"

    within(:css, "div.others") do
      page.should have_content("Otros artículos de Fitness")
      page.should have_css("ul.short_post li:eq(1) h4 a[@href$='/articulos/fitness/ejercicios-fitness-para-programadores-1']", :text => "Ejercicios fitness para programadores #1")
    end
  end

  scenario "Create and view multiple articles in the Mujer section" do
    admin = create_admin

    1.upto(12) do |i|
      time_travel_to "#{13 - i} days ago"
      create_post :user => admin, :title => "Ejercicios mujer para programadores ##{i}", :categories => "articulos,mujer"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness" if(i%3==0)
      back_to_the_present
    end

    visit "/articulos/mujer"

    page.should have_content("Mujer")

    within("div.main_post") do
      page.should have_css("a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-12']:eq(1)")
    end

    within("ul.posts") do
      within("li.post:eq(1)") do
        page.should have_css("h2 a", :text => "Ejercicios mujer para programadores #11")
      end
      within("li.post:eq(2)") do
        page.should have_css("h2 a", :text => "Ejercicios mujer para programadores #10")
      end
      within("li.post:eq(3)") do
        page.should have_css("h2 a", :text => "Ejercicios mujer para programadores #9")
      end
      within("li.post:eq(4)") do
        page.should have_css("h2 a", :text => "Ejercicios mujer para programadores #8")
      end
      within("li.post:eq(5)") do
        page.should have_css("h2 a", :text => "Ejercicios mujer para programadores #7")
      end
    end

    within(:css, "div.others") do
      page.should have_content("Otros artículos de Mujer")
      page.should have_css("ul.short_post li:eq(1) h4 a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-6']", :text => "Ejercicios mujer para programadores #6")
      page.should have_css("ul.short_post li:eq(2) h4 a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-5']", :text => "Ejercicios mujer para programadores #5")
      page.should have_css("ul.short_post li:eq(3) h4 a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-4']", :text => "Ejercicios mujer para programadores #4")
      page.should have_css("ul.short_post li:eq(4) h4 a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-3']", :text => "Ejercicios mujer para programadores #3")
      page.should have_css("ul.short_post li:eq(5) h4 a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-2']", :text => "Ejercicios mujer para programadores #2")
    end

    click "2"

    within(:css, "div.others") do
      page.should have_content("Otros artículos de Mujer")
      page.should have_css("ul.short_post li:eq(1) h4 a[@href$='/articulos/mujer/ejercicios-mujer-para-programadores-1']", :text => "Ejercicios mujer para programadores #1")
    end
  end

  scenario "Create and view multiple articles in the Mi opinión section" do
    admin = create_admin

    1.upto(12) do |i|
      time_travel_to "#{13 - i} days ago"
      create_post :user => admin, :title => "Ejercicios mi opinión para programadores ##{i}", :categories => "articulos,mi-opinion"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness" if(i%3==0)
      back_to_the_present
    end

    visit "/articulos/mi-opinion"

    page.should have_content("Mi opinión")

    within("div.main_post") do
      page.should have_css("a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-12']:eq(1)")
    end

    within("ul.posts") do
      within("li.post:eq(1)") do
        page.should have_css("h2 a", :text => "Ejercicios mi opinión para programadores #11")
      end
      within("li.post:eq(2)") do
        page.should have_css("h2 a", :text => "Ejercicios mi opinión para programadores #10")
      end
      within("li.post:eq(3)") do
        page.should have_css("h2 a", :text => "Ejercicios mi opinión para programadores #9")
      end
      within("li.post:eq(4)") do
        page.should have_css("h2 a", :text => "Ejercicios mi opinión para programadores #8")
      end
      within("li.post:eq(5)") do
        page.should have_css("h2 a", :text => "Ejercicios mi opinión para programadores #7")
      end
    end

    within(:css, "div.others") do
      page.should have_content("Otros artículos de Mi opinión")
      page.should have_css("ul.short_post li:eq(1) h4 a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-6']", :text => "Ejercicios mi opinión para programadores #6")
      page.should have_css("ul.short_post li:eq(2) h4 a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-5']", :text => "Ejercicios mi opinión para programadores #5")
      page.should have_css("ul.short_post li:eq(3) h4 a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-4']", :text => "Ejercicios mi opinión para programadores #4")
      page.should have_css("ul.short_post li:eq(4) h4 a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-3']", :text => "Ejercicios mi opinión para programadores #3")
      page.should have_css("ul.short_post li:eq(5) h4 a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-2']", :text => "Ejercicios mi opinión para programadores #2")
    end

    click "2"

    within(:css, "div.others") do
      page.should have_content("Otros artículos de Mi opinión")
      page.should have_css("ul.short_post li:eq(1) h4 a[@href$='/articulos/mi-opinion/ejercicios-mi-opinion-para-programadores-1']", :text => "Ejercicios mi opinión para programadores #1")
    end
  end

  scenario "Create and view multiple articles in the Nutrición section" do
    admin = create_admin

    1.upto(12) do |i|
      time_travel_to "#{13 - i} days ago"
      create_post :user => admin, :title => "Ejercicios nutrición para programadores ##{i}", :categories => "articulos,nutricion"
      create_post :user => admin, :title => "Ejercicios fitness para programadores ##{i}", :categories => "articulos,fitness" if(i%3==0)
      back_to_the_present
    end

    visit "/articulos/nutricion"

    page.should have_content("Nutrición")

    within("div.main_post") do
      page.should have_css("a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-12']:eq(1)")
    end

    within("ul.posts") do
      within("li.post:eq(1)") do
        page.should have_css("h2 a", :text => "Ejercicios nutrición para programadores #11")
      end
      within("li.post:eq(2)") do
        page.should have_css("h2 a", :text => "Ejercicios nutrición para programadores #10")
      end
      within("li.post:eq(3)") do
        page.should have_css("h2 a", :text => "Ejercicios nutrición para programadores #9")
      end
      within("li.post:eq(4)") do
        page.should have_css("h2 a", :text => "Ejercicios nutrición para programadores #8")
      end
      within("li.post:eq(5)") do
        page.should have_css("h2 a", :text => "Ejercicios nutrición para programadores #7")
      end
    end

    within(:css, "div.others") do
      page.should have_content("Otros artículos de Nutrición")
      page.should have_css("ul.short_post li:eq(1) h4 a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-6']", :text => "Ejercicios nutrición para programadores #6")
      page.should have_css("ul.short_post li:eq(2) h4 a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-5']", :text => "Ejercicios nutrición para programadores #5")
      page.should have_css("ul.short_post li:eq(3) h4 a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-4']", :text => "Ejercicios nutrición para programadores #4")
      page.should have_css("ul.short_post li:eq(4) h4 a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-3']", :text => "Ejercicios nutrición para programadores #3")
      page.should have_css("ul.short_post li:eq(5) h4 a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-2']", :text => "Ejercicios nutrición para programadores #2")
    end

    click "2"

    within(:css, "div.others") do
      page.should have_content("Otros artículos de Nutrición")
      page.should have_css("ul.short_post li:eq(1) h4 a[@href$='/articulos/nutricion/ejercicios-nutricion-para-programadores-1']", :text => "Ejercicios nutrición para programadores #1")
    end
  end

end
