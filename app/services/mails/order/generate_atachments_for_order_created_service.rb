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
        invoice_key = "users/#{@order.user.id}/invoices/#{@order.id}.pdf"
        object = ::Aws::S3::FetchObjectService.call(key: invoice_key)
        object.body.string
      end
    end
  end
end
