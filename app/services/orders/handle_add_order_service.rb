module Orders
  class HandleAddOrderService < BaseService
    def initialize(params:)
      super()
      @order = prepare_order(params: params)
      @products_order_params = params.fetch(:products_order)
    end

    def call
      composite = ::BaseComposite.new
      composite.add_task(task: ::Orders::AddOrderService.new(order: @order, products_order_params: @products_order_params))
      composite.add_task(task: ::Invoices::UploadOnStorageService.new(order: @order))
      composite.add_task(task: ::Orders::SendOrderEmailAdapter.new(order: @order))
      composite.call

      @order
    end

    private

    def prepare_order(params:)
      order_params = params.except(:products_order)
      Order.new(order_params)
    end
  end
end
