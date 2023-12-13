module Users
  class AddAvatarsService < BaseService
    def initialize(user:, avatars:)
      super()
      @user = user
      @avatars = avatars
    end

    def call
      uploaded_avatars_details = upload_avatars_to_storage
      update_user(uploaded_avatars_details: uploaded_avatars_details)
    end

    private

    def upload_avatars_to_storage
      ::Users::UploadAvatarsService.call(avatars: @avatars, user_id: @user.id)
    end

    def update_user(uploaded_avatars_details:)
      @user.update!(avatars: uploaded_avatars_details)
    end
  end
end
