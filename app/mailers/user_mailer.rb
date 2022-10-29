# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def registration_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Dziękujemy za rejestrację w naszym serwisie!')
  end
end
