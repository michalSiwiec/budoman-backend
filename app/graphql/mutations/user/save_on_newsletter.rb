# frozen_string_literal: true

module Mutations
  module User
    class SaveOnNewsletter < BaseMutation
      argument :email, String, required: true

      type Types::Custom::User::UserType

      def resolve(params)
        super(params)
        Graphql::Users::SaveOnNewsletterHandler.handle(@params)
      end
    end
  end
end
