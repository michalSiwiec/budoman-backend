module Users
  class HandleRegisterUserService < BaseService
    def initialize(params:, session:)
      super()
      @params = params
      @session = session
    end

    def call
      user = create_user
      composite = ::BaseComposite.new
      composite.add_task(task: ::Users::HandleAddingAvatarsService.new(user: user, avatars: @params[:avatars]))
      composite.add_task(task: ::Users::SendRegistrationMailService.new(email: @params[:email], password: @params[:password]))
      composite.add_task(task: ::Users::LoginUserService.new(user: user, session: @session))
      composite.call
      user
    end

    private

    def create_user
      user_params = @params.merge({ avatars: [] })
      User.create!(user_params)
    end
  end
end
