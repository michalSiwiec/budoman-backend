module Users
  class HandleLogoutUserService < BaseService
    def initialize(params:, session:)
      super()
      @params = params
      @session = session
    end

    def call
      logout_user
      user
    end

    private

    def logout_user
      @session[:user_token] = nil
    end

    def user
      User.find_by(@params)
    end
  end
end
