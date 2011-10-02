# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Search posts', %q{
  In order to find interesting posts to me
  As a user
  I want to be able to search posts in the site
} do

  scenario %q{
    Search posts by the keyword dieta
  } do

    admin = create_user

    post1 = create_post :title => "Ejercicios para programadores", :categories => "blog", :user => admin
    post2 = create_post :title => "Dieta para programadores", :categories => "blog", :user => admin
    post3 = create_post :title => "Dieta para diseñadores", :categories => "articulos,fitness", :user => admin
    post4 = create_post :title => "Dieta para diseñadoras", :categories => "articulos,mujer", :user => admin

    visit '/'

    page.find("form#search input").set("")
    click "buscar"

    page.should have_content "buscar en todo el site"
    page.should have_content "Resultados"
    page.should have_content "Debes de indicar un término para la búsqueda"

    page.find("form#search input").set("dieta")
    click "buscar"

    page.should have_content "buscar en todo el site"
    page.should have_content "Resultados"
    page.should have_content "Se han encontrado 3 resultados de búsqueda para dieta"
  end
end