module Orders
  class HandleAddOrderService < BaseService
    def initialize(params:)
      super()
      @order = prepare_order(params: params)
      @products_order_params = params[:products_order]
    end

    def call
      composite = ::BaseComposite.new
      composite.add_task(task: ::Orders::AddOrderService.new(order: @order, products_order_params: @products_order_params))
      composite.add_task(task: ::Aws::S3::UploadInvoiceService.new(order: @order))
      composite.add_task(task: ::Orders::SendOrderEmailService.new(order: @order))
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
