class Preview < MailView
  def signup
    UserMailer.signup(User.first)
  end
  def buy_buy_notification
    UserMailer.buy_notification(Book.first, "ferblape@gmail.com", "Hola soy Fernando Blat, mi e-mail es bla bla bla")
  end
end