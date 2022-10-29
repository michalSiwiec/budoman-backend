# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_created
    @order = params[:order]
    @presenter = OrderPresenter.new(@order)

    attach_invoice
    send_email
  end

  private

  def attach_invoice
    attachments['Faktura.pdf'] = invoice_to_attach
  end

  def invoice_to_attach
    File.read(URI.parse(url_to_invoice).open)
  end

  def url_to_invoice
    "https://#{config.aws_bucket}.#{config.aws_path}/users/#{@order.user.id}/invoices/#{@order.id}.pdf"
  end

  def config
    @config ||= Rails.application.config
  end

  def send_email
    mail(to: @order.email, subject: 'Dziękujemy za zrealizowanie zamówienia!')
  end
end
