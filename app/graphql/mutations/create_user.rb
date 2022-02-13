module Mutations
  class CreateUser < BaseMutation
    argument :input, Types::Inputs::UserInputType, required: true

    type Types::Custom::UserType

    #! Transaction here

    def resolve(params)
      super(params)
      save_avatars_on_aws
      create_user
    end

    private

    def save_avatars_on_aws
      Aws::S3::AvatarsUploader.call(@params[:avatars])
    end

    def create_user
      User.create!(@params)
    end
  end
end
