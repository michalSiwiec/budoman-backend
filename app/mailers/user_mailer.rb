# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def account_registered
    @email = params[:email]
    @password = params[:password]
    mail(to: @email, subject: 'Dziękujemy za rejestrację w naszym serwisie!')
  end
end
