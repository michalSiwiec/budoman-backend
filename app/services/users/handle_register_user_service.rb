module Users
  class HandleRegisterUserService < BaseService
    extend Utils::CallableObject

    def initialize(params:, session:)
      super()
      @params = params
      @session = session
    end

    def call
      user = create_user
      add_avatars(user: user)
      send_registration_mail
      login_user(user: user)
      user
    end

    private

    def create_user
      User.create!(@params.except(:avatars))
    end

    def add_avatars(user:)
      ::Users::AddAvatarsService.call(user: user, avatars: @params.fetch(:avatars))
    end

    def send_registration_mail
      UserMailer.with(email: @params.fetch(:email),
                      password: @params.fetch(:password)).account_registered.deliver_later
    end

    def login_user(user:)
      ::Users::SessionUserService.new(user: user, session: @session).login
    end
  end
end
