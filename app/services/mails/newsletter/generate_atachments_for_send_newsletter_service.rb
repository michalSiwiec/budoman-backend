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
        construction_presentation_key = 'documents/prezentacja-budowlana.pptx'
        object = ::Aws::S3::FetchObjectService.call(key: construction_presentation_key)
        object.body.string
      end
    end
  end
end
