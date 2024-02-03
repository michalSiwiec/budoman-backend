module Users
  class UploadAvatarsService
    extend Utils::CallableObject

    def initialize(user_id:, avatars:)
      super()
      @user_id = user_id
      @avatars = avatars
      @uploaded_avatars_details = []
    end

    def call
      @avatars.each do |avatar|
        payload = build_avatar_payload(avatar: avatar)
        is_avatar_valid = validate_avatar(avatar_as_base64: payload[:base64])
        next unless is_avatar_valid

        upload_avatar_to_storage(payload: payload)
        save_avatar_details(payload: payload)
      end

      @uploaded_avatars_details
    end

    private

    def build_avatar_payload(avatar:)
      ::Users::BuildAvatarPayloadService.call(user_id: @user_id, avatar: avatar)
    end

    def validate_avatar(avatar_as_base64:)
      ::Users::ValidateAvatarService.call(avatar_as_base64: avatar_as_base64)
    end

    def upload_avatar_to_storage(payload:)
      ::Services::Aws::S3Service.new.put_object(body: payload.fetch(:base64), key: payload.fetch(:path))
    end

    def save_avatar_details(payload:)
      @uploaded_avatars_details << payload.fetch(:details)
    end
  end
end
