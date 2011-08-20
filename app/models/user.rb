# coding: UTF-8

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :avatar, :name_and_surname, :newsletter, :sex
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :name_and_surname, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :name_and_surname

  before_create :set_confirmation_token
  after_create :deliver_confirmation_email

  mount_uploader :avatar, AvatarUploader

  scope :pending,   where("confirmation_token is null")
  scope :confirmed, where("confirmation_token is not null")

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

  def login; name_and_surname end

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

  private

  def set_confirmation_token
    write_attribute(:confirmation_token, self.class.make_token)
  end

  def deliver_confirmation_email
    UserMailer.signup(self).deliver
  end

end
