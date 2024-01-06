module Users
  class DestroyUserService
    extend Utils::CallableObject

    def initialize(user:)
      @user = user
    end

    def call
      destroy_user
    end

    private

    def destroy_user
      @user.destroy!
    end
  end
end
