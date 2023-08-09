# frozen_string_literal: true

class AddOrderHandler < BaseHandler
  def initialize(params)
    super()
    @order_params = params.except(:products_order)
    @products_order_params = params[:products_order]
  end

  def handle
    handle_order_creation
    upload_invoice_on_storage
    send_order_email
    @order
  end

  private

  def handle_order_creation
    create_order
    create_order_products
    update_products_quantities
    @order.save!
  end

  def create_order
    @order = Order.new(@order_params)
  end

  def create_order_products
    @products_order_params.each do |product_order_params|
      @order.products_orders << ProductsOrder.new(product_order_params)
    end
  end

  def update_products_quantities
    @order.products_orders.each do |product_order|
      product = product_order.product
      ordered_quantity = product_order.product_quantity

      product.update!(available_quantity: product.available_quantity - ordered_quantity)
    end
  end

  def upload_invoice_on_storage
    Aws::S3::UploadInvoiceService.call(order: @order)
  end

  def send_order_email
    OrderMailer.with(order: @order).order_created.deliver_later
  end
end
