module Users
  class HandleAddingAvatarsService
    def initialize(user:, avatars:)
      @user = user
      @avatars = avatars
    end

    def call
      uploaded_avatars_details = upload_avatars_to_storage
      update_user(uploaded_avatars_details: uploaded_avatars_details)
    end

    private

    def upload_avatars_to_storage
      ::Aws::S3::AvatarsUploaderService.call(avatars: @avatars, user_id: @user.id)
    end

    def update_user(uploaded_avatars_details:)
      @user.update!(avatars: uploaded_avatars_details)
    end
  end
end
