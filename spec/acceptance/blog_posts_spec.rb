# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Blog Posts', %q{
  In order to have content in my site
  As an administrator
  I want to be able to create and edit posts and view them in the section Blog
} do

  scenario "Create and view an article in Blog section" do
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
    page.should have_css("div.navigation a.selected", :text => "Blog")
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

    login_as admin

    1.upto(6) do |i|
      time_travel_to "#{7 - i} days ago"

      click "Crear nuevo post"

      fill_post :title => "Ejercicios para programadores ##{i}",
                :category => "Blog"

      click "Publicar"
      page.should have_content "El post ha sido publicado correctamente"

      back_to_the_present
    end

    time_travel_to "6 days ago"
    click "Crear nuevo post"

    fill_post :title => "Ejercicios de fitness",
              :category => "Artículos > Fitness"

    click "Publicar"
    page.should have_content "El post ha sido publicado correctamente"
    back_to_the_present

    visit blog_path

    page.should have_css("div.navigation a.selected", :text => "Blog")
    page.should have_content("Blog de Domingo Sánchez")

    within(:css, "div.main_post") do
      page.should have_css("h2", :text => "Ejercicios para programadores #6")
    end

    page.all("div.post")[0].find("h2").text.should == "Ejercicios para programadores #5"
    page.all("div.post")[1].find("h2").text.should == "Ejercicios para programadores #4"
    page.all("div.post")[2].find("h2").text.should == "Ejercicios para programadores #3"

    # TODO: this does not work. A mistery...
    # within(:css, "body div.post:nth-child(1)") do
    #   page.should have_css("h2", :text => "Ejercicios para programadores #5")
    # end
    #
    # within(:css, "div.post:nth-child(2)") do
    #   page.should have_css("h2", :text => "Ejercicios para programadores #4")
    # end
    #
    # within(:css, "div.post:nth-child(3)") do
    #   page.should have_css("h2", :text => "Ejercicios para programadores #3")
    # end

    within(:css, "div.others") do
      page.should have_content("Otras entradas en el blog")
      page.should have_css("li.short_post:eq(1) a[@href$='/blog/ejercicios-para-programadores-2']", :text => "Ejercicios para programadores #2")
      page.should have_css("li.short_post:eq(2) a[@href$='/blog/ejercicios-para-programadores-1']", :text => "Ejercicios para programadores #1")
    end
  end

end
