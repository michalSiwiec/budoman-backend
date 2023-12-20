module Orders
  class HandleAddOrderService
    extend Utils::CallableObject

    def initialize(params:)
      super()
      @order_params = params.except(:products_order)
      @order_products_params = params.fetch(:products_order)
    end

    def call
      order = add_order
      upload_on_storage(order: order)
      send_order_created_email(order: order)
      order
    end

    private

    def add_order
      ::Orders::AddOrderService.call(order_params: @order_params, order_products_params: @order_products_params)
    end

    def upload_on_storage(order:)
      ::Invoices::UploadOnStorageService.call(order: order)
    end

    def send_order_created_email(order:)
      OrderMailer.with(order: order).order_created.deliver_later(queue: :order)
    end
  end
end
