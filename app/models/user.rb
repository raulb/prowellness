# coding: UTF-8

require 'texticle/searchable'

class User < ActiveRecord::Base

  extend Searchable(:login, :name_and_surname, :email)

  attr_accessible :email, :password, :password_confirmation, :avatar,
                  :name_and_surname, :newsletter, :sex, :login

  has_secure_password

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :login, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :login
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  before_create :set_confirmation_token
  after_create :deliver_confirmation_email

  mount_uploader :avatar, AvatarUploader

  scope :pending,   where("confirmation_token is not null")
  scope :confirmed, where("confirmation_token is null")

  has_many :posts

  def self.authenticate(email, password)
    user = confirmed.where(:email => email).first
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

  def set_as_admin!
    update_attribute(:admin, true)
    activate!
  end

  def activate!
    write_attribute(:confirmation_token, nil)
    save!
  end

  def self.secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end

  def self.make_token
    secure_digest(Time.now, (1..10).map{ rand.to_s })
  end

  def signature
    !name_and_surname.blank? ? name_and_surname : login
  end

  private

  def set_confirmation_token
    write_attribute(:confirmation_token, self.class.make_token)
  end

  def deliver_confirmation_email
    UserMailer.signup(self).deliver
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
#  login              :string(255)
#

