# coding: UTF-8

class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  default_url_options[:host] = "localhost:3000"

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
    mail :to => "dsanchez@prowellness.es",
         :subject => "Un nuevo pedido del libro #{book.title} de #{email}"
  end

end
