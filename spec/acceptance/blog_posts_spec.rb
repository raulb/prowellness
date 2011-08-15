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

    login_as admin

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

    within(:css, "div.main_post") do
      page.should have_css("h2", :text => "Ejercicios para programadores #6")
    end

    page.all("div.post")[0].find("h2").text.should == "Ejercicios para programadores #5"
    page.all("div.post")[1].find("h2").text.should == "Ejercicios para programadores #4"
    page.all("div.post")[2].find("h2").text.should == "Ejercicios para programadores #3"

    within(:css, "div.others") do
      page.should have_content("Otras entradas en el blog")
      page.should have_css("li.short_post:eq(1) a[@href$='/blog/ejercicios-para-programadores-2']", :text => "Ejercicios para programadores #2")
      page.should have_css("li.short_post:eq(2) a[@href$='/blog/ejercicios-para-programadores-1']", :text => "Ejercicios para programadores #1")
      page.should have_css("li.short_post:eq(3) a[@href$='/blog/antiguos-ejercicios-para-programadores-10']", :text => "Antiguos ejercicios para programadores #10")
      page.should have_css("li.short_post:eq(4) a[@href$='/blog/antiguos-ejercicios-para-programadores-9']",  :text => "Antiguos ejercicios para programadores #9")
      page.should have_css("li.short_post:eq(5) a[@href$='/blog/antiguos-ejercicios-para-programadores-8']",  :text => "Antiguos ejercicios para programadores #8")
    end

    click "2"

    within(:css, "div.others") do
      page.should have_content("Otras entradas en el blog")
      page.should have_css("li.short_post:eq(1) a[@href$='/blog/antiguos-ejercicios-para-programadores-7']",  :text => "Antiguos ejercicios para programadores #7")
      page.should have_css("li.short_post:eq(2) a[@href$='/blog/antiguos-ejercicios-para-programadores-6']",  :text => "Antiguos ejercicios para programadores #6")
      page.should have_css("li.short_post:eq(3) a[@href$='/blog/antiguos-ejercicios-para-programadores-5']",  :text => "Antiguos ejercicios para programadores #5")
      page.should have_css("li.short_post:eq(4) a[@href$='/blog/antiguos-ejercicios-para-programadores-4']",  :text => "Antiguos ejercicios para programadores #4")
      page.should have_css("li.short_post:eq(5) a[@href$='/blog/antiguos-ejercicios-para-programadores-3']",  :text => "Antiguos ejercicios para programadores #3")
    end

    click "3"

    within(:css, "div.others") do
      page.should have_content("Otras entradas en el blog")
      page.should have_css("li.short_post:eq(1) a[@href$='/blog/antiguos-ejercicios-para-programadores-2']",  :text => "Antiguos ejercicios para programadores #2")
      page.should have_css("li.short_post:eq(2) a[@href$='/blog/antiguos-ejercicios-para-programadores-1']",  :text => "Antiguos ejercicios para programadores #1")
    end
  end

end
