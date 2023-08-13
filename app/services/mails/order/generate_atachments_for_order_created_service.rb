module Mails
  module Order
    class GenerateAtachmentsForOrderCreatedService < BaseService
      def initialize(order:)
        super()
        @order = order
      end

      def call
        attachments = []
        attachments << { file_name: 'Faktura.pdf', content: invoice }
        attachments
      end

      private

      def invoice
        config = Rails.application.config
        url_to_invoice = "https://#{config.aws_bucket}.#{config.aws_path}/users/#{@order.user.id}/invoices/#{@order.id}.pdf"
        ::ConvertFileToStringService.call(path_to_file: url_to_invoice)
      end
    end
  end
end
