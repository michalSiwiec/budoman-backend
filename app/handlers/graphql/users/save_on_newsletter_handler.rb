# frozen_string_literal: true

module Graphql
  module Users
    class SaveOnNewsletterHandler < BaseHandler
      def initialize(params)
        super()
        @params = params
      end

      def handle
        User.last
      end
    end
  end
end
