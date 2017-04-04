class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to my page') do |format|
      format.html
    end
  end
end
