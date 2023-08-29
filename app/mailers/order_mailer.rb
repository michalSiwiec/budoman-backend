class OrderMailer < ApplicationMailer
  ORDER_CREATED_TITLE = 'Dziękujemy za zrealizowanie zamówienia!'.freeze

  def order_created
    order = params.fetch(:order)

    @presenter = OrderPresenter.new(order)
    attach_attachments(attachments_data_generator: ::Mails::Order::GenerateAtachmentsForOrderCreatedService.new(order: order))
    send_email(recipient_email: order.email, title: ORDER_CREATED_TITLE)
  end
end
