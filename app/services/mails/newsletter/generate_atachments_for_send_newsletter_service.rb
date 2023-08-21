module Mails
  module Newsletter
    class GenerateAtachmentsForSendNewsletterService < BaseService
      def call
        attachments = []
        attachments << { file_name: 'Prezentacja budowlana.pptx', content: construction_presentation }
        attachments
      end

      private

      def construction_presentation
        config = Rails.application.config
        url_to_invoice = "https://#{config.aws_bucket}.#{config.aws_path}/documents/prezentacja-budowlana.pptx"
        ::ConvertFileToStringService.call(path_to_file: url_to_invoice)
      end
    end
  end
end
