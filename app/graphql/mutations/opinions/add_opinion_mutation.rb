# frozen_string_literal: true

module Mutations
  module Opinions
    class AddOpinionMutation < BaseMutation
      argument :input, Types::Custom::Inputs::Mutations::OpinionInput, required: true
      type Types::Custom::Objects::Opinions::OpinionObject
  
      def resolve(params)
        super(params)
        ::Opinions::AddOpinionService.call(params: @params)
      end
    end
  end
end
