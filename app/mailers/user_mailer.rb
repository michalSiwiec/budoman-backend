# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def account_registered
    @user = params[:user]
    mail(to: @user.email, subject: 'Dziękujemy za rejestrację w naszym serwisie!')
  end

  def newsletter
    @user = params[:user]

    attach_presentation
    send_newsletter_mail
  end

  private

  def attach_presentation
    attachments['Prezentacja budowlana.pptx'] = presentation_to_attach
  end

  def presentation_to_attach
    File.read(URI.parse(url_to_presentation).open)
  end

  def url_to_presentation
    "https://#{config.aws_bucket}.#{config.aws_path}/documents/prezentacja-budowlana.pptx"
  end

  def config
    @config ||= Rails.application.config
  end

  def send_newsletter_mail
    mail(to: @user.email, subject: 'Cotygodniowy newsletter!')
  end
end
