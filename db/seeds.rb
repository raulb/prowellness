# coding: UTF-8

require File.expand_path("../../spec/support/posts_factory", __FILE__)
require File.expand_path("../../spec/support/string_extension", __FILE__)

include Delorean
include Prowellness::Factories

# Setup a user pending confirmation

user_pending_confirmation = User.new
user_pending_confirmation.email = 'user_pending_confirmation@example.com'
user_pending_confirmation.password = 'user_pending_confirmation'
user_pending_confirmation.password_confirmation = 'user_pending_confirmation'
user_pending_confirmation.login = 'user_pending_confirmation'
user_pending_confirmation.name_and_surname = 'User Pending'
user_pending_confirmation.save

# Setup a new user

admin = User.new
admin.email = 'admin@example.com'
admin.password = 'admin'
admin.password_confirmation = 'admin'
admin.login = 'admin'
admin.name_and_surname = 'Domingo Sánchez'
admin.save
admin.set_as_admin!
admin.reload
admin.activate!
admin.reload

puts "Loading posts"

# Setup 10 blog posts in different days
1.upto(10) do |i|
  time_travel_to "#{11 - i} days ago"
  post = create_post :title => "[Blog] Ejercicios para programadores ##{i}", :categories => "blog", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 10 articles in different days
1.upto(16) do |i|
  time_travel_to "#{17 - i} days ago"
  post = create_post :title => "[Artículos] [Fitness] Ejercicios para programadores ##{i}", :categories => "articulos,fitness", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 10 articles in different days
1.upto(10) do |i|
  time_travel_to "#{11 - i} days ago"
  post = create_post :title => "[Artículos] [Mujer] Ejercicios para programadores ##{i}", :categories => "articulos,mujer", :user => admin
  putc '.'
  back_to_the_present
end

1.upto(10) do |i|
  time_travel_to "#{11 - i} days ago"
  post = create_post :title => "[Artículos] [Nutrición] Ejercicios para programadores ##{i}", :categories => "articulos,nutricion", :user => admin
  putc '.'
  back_to_the_present
end

1.upto(10) do |i|
  time_travel_to "#{11 - i} days ago"
  post = create_post :title => "[Artículos] [Mi opinión] Ejercicios para programadores ##{i}", :categories => "articulos,mi-opinion", :user => admin
  putc '.'
  back_to_the_present
end

# 3 posts in visual guide, editorial
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Guía visual] [Editorial] Ejercicios para programadores ##{i}", :categories => "guia-visual,editorial", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, abdominales, nivel 1
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Abdominales] [Nivel 1] Ejercicios para programadores ##{i}", :categories => "guia-visual,abdominales,nivel-2-estables", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, abdominales, nivel 2
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Abdominales] [Nivel 2] Ejercicios para programadores ##{i}", :categories => "guia-visual,abdominales,nivel-1-activacion", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, abdominales, nivel 3
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Abdominales] [Nivel 3] Ejercicios para programadores ##{i}", :categories => "guia-visual,abdominales,nivel-3-en-apoyo", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, abdominales, nivel 4
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Abdominales] [Nivel 4] Ejercicios para programadores ##{i}", :categories => "guia-visual,abdominales,nivel-4-con-material", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, abdominales, nivel 5
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Abdominales] [Nivel 5] Ejercicios para programadores ##{i}", :categories => "guia-visual,abdominales,nivel-5-potencia", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, estiramientos, pantorrilla
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Estiramientos] [pantorrilla Ejercicios para programadores ##{i}", :categories => "guia-visual,estiramientos,pantorrilla", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, estiramientos, musculo
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Estiramientos] [pantorrilla Ejercicios para programadores ##{i}", :categories => "guia-visual,estiramientos,musculo", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, estiramientos, cadera
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Estiramientos] [pantorrilla Ejercicios para programadores ##{i}", :categories => "guia-visual,estiramientos,cadera", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, estiramientos, tronco
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Estiramientos] [pantorrilla Ejercicios para programadores ##{i}", :categories => "guia-visual,estiramientos,tronco", :user => admin
  putc '.'
  back_to_the_present
end

# Setup 3 articles in visual guide, estiramientos, pectorales
1.upto(3) do |i|
  time_travel_to "#{4 - i} days ago"
  post = create_post :title => "[Artículos] [Estiramientos] [pantorrilla Ejercicios para programadores ##{i}", :categories => "guia-visual,estiramientos,pectorales", :user => admin
  putc '.'
  back_to_the_present
end

back_to_the_present
time_travel_to "3 months ago"
create_post :title => "[Artículos] [Fitness] [Ejercicio del mes] Ejercicios del mes de #{Date.today.month}", :categories => "articulos,fitness,ejercicio-del-mes", :user => admin
putc '.'
back_to_the_present

time_travel_to "2 months ago"
create_post :title => "[Artículos] [Fitness] [Ejercicio del mes] Ejercicios del mes de #{Date.today.month}", :categories => "articulos,fitness,ejercicio-del-mes", :user => admin
putc '.'
back_to_the_present

time_travel_to "1 month ago"
create_post :title => "[Artículos] [Fitness] [Ejercicio del mes] Ejercicios del mes de #{Date.today.month}", :categories => "articulos,fitness,ejercicio-del-mes", :user => admin
putc '.'
back_to_the_present

create_post :title => "[Artículos] [Fitness] [Ejercicio del mes] Ejercicios del mes de #{Date.today.month}", :categories => "articulos,fitness,ejercicio-del-mes", :user => admin
putc '.'

puts

# Create book "Entrénate"
@book = Book.create :title => "Entrénate"

# Create some videos for the book "Entérate"
@book.videos.create :code => "123ABC", :video => '<iframe width="560" height="315" src="http://www.youtube.com/embed/P-Un2t25aqE" frameborder="0" allowfullscreen></iframe>'

# Create book "Mujer"
@book = Book.create :title => "Mujer"

# Create some videos for the book "Mujer"
@book.videos.create :code => "345ABC", :video => '<iframe width="560" height="315" src="http://www.youtube.com/embed/l78yD0NMM9I" frameborder="0" allowfullscreen></iframe>'