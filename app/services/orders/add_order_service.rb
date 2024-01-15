module Orders
  class AddOrderService
    extend Utils::CallableObject

    def initialize(order_params:, order_products_params:)
      @order_params = order_params
      @order_products_params = order_products_params
    end

    def call
      ActiveRecord::Base.transaction do
        order = Order.new(@order_params)
        add_products_to_order(order: order)
        update_products_quantity(order: order)
        order.save!
        order
      end
    end

    private

    def add_products_to_order(order:)
      @order_products_params.each { |params| order.products_orders << ProductsOrder.new(params) }
    end

    def update_products_quantity(order:)
      order.products_orders.each do |product_order|
        product = product_order.product
        ordered_quantity = product_order.product_quantity
        actual_quantity = product.available_quantity - ordered_quantity

        product.update!(available_quantity: actual_quantity)
      end
    end
  end
end
