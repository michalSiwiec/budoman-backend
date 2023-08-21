class NewsletterMailer < ApplicationMailer
  SEND_NEWSLETTER_TITLE = 'Cotygodniowy newsletter!'.freeze

  def send_newsletter
    @newsletter = params[:newsletter]
    attach_attachments(attachments_data_generator: ::Mails::Newsletter::GenerateAtachmentsForSendNewsletterService.new)
    send_email(recipient_email: @newsletter.email, title: SEND_NEWSLETTER_TITLE)
  end
end
