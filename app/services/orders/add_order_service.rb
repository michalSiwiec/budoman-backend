module Orders
  class AddOrderService
    def initialize(order:, products_order_params:)
      @order = order
      @products_order_params = products_order_params
    end

    def call
      add_products_to_order
      update_products_quantities
      @order.save!
    end

    private

    def add_products_to_order
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
  end
end
