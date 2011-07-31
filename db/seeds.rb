admin = User.new
admin.email = 'admin@example.com'
admin.password = 'admin'
admin.password_confirmation = 'admin'
admin.name_and_surname = 'Admin'
admin.save
admin.set_as_admin!

