# coding: UTF-8

require 'spec_helper'

describe User do
  context "a new user" do
    let(:user) { User.new }

    it "should require an e-mail and a name and surname" do
      user.save
      user.should be_invalid
      user.errors[:email].should_not be_nil
      user.errors[:password].should_not be_nil
      user.errors[:name_and_surname].should_not be_nil
    end

    it "has to match the password and the password confirmation" do
      user.password = 'admin123'
      user.password_confirmation = 'admin321'
      user.email = 'user@example.com'
      user.name_and_surname = 'Name and surname'
      user.save
      user.should_not be_valid
      user.errors[:password].should_not be_nil
    end

    it "must has an confirmation token when created" do
      user.password = 'admin123'
      user.password_confirmation = 'admin123'
      user.email = 'user@example.com'
      user.name_and_surname = 'Name and surname'
      user.save
      user.reload
      user.should be_valid
      user.confirmation_token.should_not be_nil
    end
  end

  context "an admin user" do
    let(:admin) do
      user = User.new :email => 'admin@example.com', :password => 'admin123',
                      :password_confirmation => 'admin123', :name_and_surname => 'Administrator'
      user.save
      user.set_as_admin!
      user.reload
      user
    end

    it "should be administrator" do
      admin.should be_admin
    end

    it "should be able to get authenticated if confirmed" do
      User.authenticate('admin@example.com', 'admin123').should be_nil
      User.authenticate('admin@example.com', 'admin321').should be_nil

      admin.activate!

      User.authenticate('admin@example.com', 'admin123') == admin
      User.authenticate('admin@example.com', 'admin321').should be_nil
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name_and_surname   :string(255)
#  email              :string(255)
#  password_digest    :string(255)
#  admin              :boolean         default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  newsletter         :boolean         default(TRUE)
#  sex                :integer
#  avatar             :string(255)
#  confirmation_token :string(255)
#

