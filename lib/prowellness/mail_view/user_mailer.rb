class Preview < MailView
  def signup
    UserMailer.signup(User.first)
  end
end