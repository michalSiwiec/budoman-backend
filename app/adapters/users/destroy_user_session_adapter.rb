module Users
  class DestroyUserSessionAdapter
    def initialize(session:, user:)
      @session_user_service = ::Users::SessionUserService.new(session: session, user: user)
    end

    def call
      destroy_user_service
    end

    private

    def destroy_user_service
      @session_user_service.destroy
    end
  end
end
