module Mutations
  class CreateUser < BaseMutation
    argument :input, Types::Inputs::UserInputType, required: true

    type Types::Custom::UserType

    def resolve(params)
      super(params)
      User.create!(@params)
    end
  end
end
