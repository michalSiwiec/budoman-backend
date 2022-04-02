# frozen_string_literal: true

module Graphql
  class CreateUserHandler < BaseHandler
    def initialize(params)
      super()
      @params = params
    end

    def handle
      create_user!
      save_avatars_on_aws
      update_user_avatars!
      @user
    end

    private

    def create_user!
      @user = User.create!(user_params)
    end

    def user_params
      @params.merge({ avatars: [] })
    end

    def save_avatars_on_aws
      @uploaded_avatars_details = Aws::S3::AvatarsUploader.call(avatars: @params[:avatars], id: @user.id)
    end

    def update_user_avatars!
      @user.update!(avatars: @uploaded_avatars_details)
    end
  end
end
