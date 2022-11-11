# frozen_string_literal: true

class RegisterUserHandler < BaseHandler
  def initialize(params:, session:)
    super()
    @params = params
    @session = session
  end

  def handle
    user
    handle_avatars_creation
    send_registration_mail
    login_user
    user
  end

  private

  def user
    @user ||= User.create!(user_params)
  end

  def user_params
    @params.merge({ avatars: [] })
  end

  def handle_avatars_creation
    save_avatars_on_aws
    update_user_avatars
  end

  def save_avatars_on_aws
    @uploaded_avatars_details = Aws::S3::AvatarsUploaderService.call(avatars: @params[:avatars], user_id: user.id)
  end

  def update_user_avatars
    user.update!(avatars: @uploaded_avatars_details)
  end

  def send_registration_mail
    UserMailer.with(email: @params[:email],
                    password: @params[:password]).account_registered.deliver_later
  end

  def login_user
    SessionUserService.new(user: user, session: @session).login
  end
end
