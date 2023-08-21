module Orders
  class SendOrderEmailAdapter
    def initialize(order:)
      @order = order
    end

    def call
      send_order_email
    end

    private

    def send_order_email
      OrderMailer.with(order: @order).order_created.deliver_later(queue: :order)
    end
  end
end
