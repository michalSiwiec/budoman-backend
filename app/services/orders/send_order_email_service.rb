module Orders
  class SendOrderEmailService
    def initialize(order:)
      @order = order
    end

    def call
      send_order_email
    end

    private

    def send_order_email
      OrderMailer.with(order: @order).order_created.deliver_later
    end
  end
end
