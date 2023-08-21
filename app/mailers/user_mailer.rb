# frozen_string_literal: true

class UserMailer < ApplicationMailer
  ACCOUNT_REGISTERED_TITLE = 'Dziękujemy za rejestrację w naszym serwisie!'

  def account_registered
    @email = params[:email]
    @password = params[:password]
    send_email(recipient_email: @email, title: ACCOUNT_REGISTERED_TITLE)
  end
end
