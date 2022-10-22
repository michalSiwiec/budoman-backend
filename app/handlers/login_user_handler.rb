# frozen_string_literal: true

class LoginUserHandler < BaseHandler
  def initialize(params:, session:)
    super()
    @params = params
    @session = session
  end

  def handle
    save_user_token_to_session
    user
  end

  private

  def save_user_token_to_session
    @session[:user_token] = user_token
  end

  def user_token
    JWT.encode(user.id, nil, 'none')
  end

  def user
    @user ||= User.find_by!(@params)
  end
end
