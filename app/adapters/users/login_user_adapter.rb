module Users
  class LoginUserAdapter
    def initialize(user:, session:)
      @session_user_service = ::SessionUserService.new(user: user, session: session)
    end

    def call
      @session_user_service.login
    end
  end
end
