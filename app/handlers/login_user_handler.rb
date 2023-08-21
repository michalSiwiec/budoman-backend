# frozen_string_literal: true

class LoginUserHandler < BaseHandler
  def initialize(params:, session:)
    super()
    @params = params
    @session = session
  end

  def handle
    login_user
    user
  end

  private

  def login_user
    ::Users::SessionUserService.new(user: user, session: @session).login
  end

  def user
    @user ||= User.find_by!(email: @params[:email]).authenticate(@params[:password])
  end
end
