# frozen_string_literal: true

class UpdateUserHandler < BaseHandler
  def initialize(params)
    super()
    @user_id = params[:user_id]
    @attributes_to_update = params.except(:user_id)
  end

  def handle
    update_user_details
    user
  end

  private

  def update_user_details
    user.update!(@attributes_to_update)
  end

  def user
    @user ||= User.find(@user_id)
  end
end
