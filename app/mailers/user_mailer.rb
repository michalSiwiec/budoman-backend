# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def registration_email
    @user = User.last
    mail(to: @user.email, subject: 'Dziękujemy za rejestrację w naszym serwisie!').deliver
  end
end
