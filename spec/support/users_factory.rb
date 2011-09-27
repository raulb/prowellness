# coding: UTF-8

module Prowellness
  module Factories
    def new_user(attributes = {})
      attributes = attributes.dup
      user = User.new
      user.login                 = attributes[:login] || String.random(5)
      user.name_and_surname      = attributes[:name_and_surname] || String.random(5) + ' ' +  String.random(5)
      user.email                 = attributes[:email]    || String.random(5).downcase + '@' + String.random(5).downcase + '.com'
      user.password              = attributes[:password] || user.email.split('@').first
      user.password_confirmation = user.password
      user
    end

    def create_user(attributes = {})
      user = new_user(attributes)
      user.save
      user
    end

    def create_admin(attributes = {})
      user = create_user(attributes)
      user.set_as_admin!
      user.reload
      user
    end
  end
end