require File.expand_path("../../spec/support/posts_factory", __FILE__)
require File.expand_path("../../spec/support/string_extension", __FILE__)

include Delorean
include Prowellness::Factories

# Setup a new user

admin = User.new
admin.email = 'admin@example.com'
admin.password = 'admin'
admin.password_confirmation = 'admin'
admin.name_and_surname = 'Admin'
admin.save
admin.set_as_admin!
admin.reload

# Setup 20 blog posts in different days

1.upto(20) do |i|
  time_travel_to "#{21 - i} days ago"
  post = create_post :title => "Ejercicios para programadores ##{i}", :categories => "blog", :user => admin
  back_to_the_present
end
