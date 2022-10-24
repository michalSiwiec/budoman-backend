# frozen_string_literal: true

class ChangeUserPasswordHandler < BaseHandler
  def initialize(params)
    super()
    @params = params
  end

  def handle
    update_user_password
    user
  end

  private

  def update_user_password
    user.update!(password: @params[:password])
  end

  def user
    @user ||= User.find(@params[:id])
  end
end
