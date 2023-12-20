module Users
  class CleanStorageObjectsService
    extend Utils::CallableObject

    def initialize(user:)
      super()
      @user = user
    end

    def call
      s3_service = ::Aws::S3Service.new
      directory_name = "users/#{@user.id}"
      user_objects = s3_service.list_objects(directory_name: directory_name).contents

      user_objects.each do |object|
        s3_service.delete_object(key: object.key)
      end
    end
  end
end
