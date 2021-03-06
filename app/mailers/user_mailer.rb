# coding: UTF-8

class UserMailer < ActionMailer::Base
  default from: "no-reply@prowellness.com"

  def signup(user)
    @name = user.login
    @url  = confirm_account_url(user.confirmation_token)

    mail :to => user.email,
         :subject => "[prowellness] Confirma tu cuenta"
  end

  def buy_notification(book, email, text)
    @email = email
    @text = text
    @book = book
    mail :to => "ventasonline@prowellness.es",
         :subject => "Un nuevo pedido del libro #{book.title} de #{email}",
         :reply_to => email
  end

  def password_reset(user)
    @user = user
    mail :to => user.email,
         :subject => "[prowellness] ¿Has olvidado tu contraseña?"
  end

end
