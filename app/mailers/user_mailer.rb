# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def account_registered
    @email = params[:email]
    @password = params[:password]
    mail(to: @email, subject: 'Dziękujemy za rejestrację w naszym serwisie!')
  end

  def newsletter
    @newsletter = params[:newsletter]

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
    mail(to: @newsletter.email, subject: 'Cotygodniowy newsletter!')
  end
end
