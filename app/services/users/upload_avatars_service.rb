module Users
  class UploadAvatarsService < BaseService
    def initialize(user_id:, avatars:)
      super()
      @user_id = user_id
      @avatars = avatars
      @uploaded_avatars_details = []
    end

    def call
      @avatars.each do |avatar|
        payload = ::Aws::S3::AvatarBuilder.build(user_id: @user_id, avatar: avatar)
        upload_avatar_to_storage(payload: payload)
        save_avatar_details(payload: payload)
      end

      @uploaded_avatars_details
    end

    private

    def upload_avatar_to_storage(payload:)
      s3_service = ::Aws::S3Service.new
      s3_service.put_object(body: payload.fetch(:base64), key: payload.fetch(:path))
    end

    def save_avatar_details(payload:)
      @uploaded_avatars_details << payload.fetch(:details)
    end
  end
end
