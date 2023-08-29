module Users
  class HandleLoginUserService < BaseService
    def initialize(params:, session:)
      super()
      @params = params
      @session = session
    end

    def call
      user = find_user
      login_user(user: user)
      user
    end

    private

    def find_user
      User.find_by!(email: @params.fetch(:email)).authenticate(@params.fetch(:password))
    end

    def login_user(user:)
      ::Users::SessionUserService.new(user: user, session: @session).login
    end
  end
end
