# coding: UTF-8

require File.expand_path("../../spec/support/posts_factory", __FILE__)
require File.expand_path("../../spec/support/string_extension", __FILE__)

include Delorean
include Prowellness::Factories

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

puts