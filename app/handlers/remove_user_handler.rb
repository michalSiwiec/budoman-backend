# frozen_string_literal: true

class RemoveUserHandler < BaseHandler
  def initialize(user_id:, session:)
    super()
    @user_id = user_id
    @session = session
  end

  def handle
    unsubscribe_from_newsletter
    clear_session
    destroy_user
  end

  private

  def unsubscribe_from_newsletter
    Newsletter.find_by(email: user.email)&.destroy!
  end

  def clear_session
    @session.destroy
  end

  def destroy_user
    user.destroy!
  end

  def user
    @user ||= User.find(@user_id)
  end
end
