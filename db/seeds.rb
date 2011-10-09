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

create_post :title => "[Artículos] [Fitness] [Ejercicio del mes] Ejercicios del mes de #{Date.today.month}", :categories => "articulos,fitness,ejercicio-del-mes", :user => admin
putc '.'

puts