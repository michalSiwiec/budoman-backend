module Users
  class LoginUserService
    def initialize(user:, session:)
      @user = user
      @session = session
    end

    def call
      login_user
    end

    private

    def login_user
      SessionUserService.new(user: @user, session: @session).login
    end
  end
end
