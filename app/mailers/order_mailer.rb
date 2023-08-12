require 'open-uri'

class OrderMailer < ApplicationMailer
  def order_created
    @order = params[:order]
    @presenter = OrderPresenter.new(@order)

    attach_attachments
    send_email
  end

  private

  def attach_attachments
    attachments['Faktura.pdf'] = invoice_to_attach
  end

  def invoice_to_attach
    config = Rails.application.config
    url_to_invoice = "https://#{config.aws_bucket}.#{config.aws_path}/users/#{@order.user.id}/invoices/#{@order.id}.pdf"
    open(url_to_invoice).read
  end

  def send_email
    mail(to: @order.email, subject: 'Dziękujemy za zrealizowanie zamówienia!')
  end
end
