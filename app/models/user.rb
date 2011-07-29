# coding: UTF-8

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :name_and_surname, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :name_and_surname
  
  def self.authenticate(email, password)
    user = where(:email => email).first
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
  
  def set_as_admin!
    update_attribute(:admin, true)
  end
  
end
