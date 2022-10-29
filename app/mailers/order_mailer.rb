# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_created
    @order = params[:order]
    mail(to: @order.email, subject: 'Dziękujemy za zrealizowanie zamówienia!')
  end
end
