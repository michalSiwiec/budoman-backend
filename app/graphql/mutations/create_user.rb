module Mutations
  class CreateUser < BaseMutation
    argument :input, Types::Inputs::UserInputType, required: true

    type Types::Custom::UserType

    def resolve(params)
      super(params)
      Graphql::CreateUserHandler.new(@params).handle
    end
  end
end
