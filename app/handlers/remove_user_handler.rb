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
    remove_user_objects_from_s3
    destroy_user
  end

  private

  def unsubscribe_from_newsletter
    Newsletter.find_by(email: user.email)&.destroy!
  end

  def clear_session
    @session.destroy
  end

  def remove_user_objects_from_s3
    Aws::S3::UserObjectsCleanerService.new(user).call
  end

  def destroy_user
    user.destroy!
  end

  def user
    @user ||= User.find(@user_id)
  end
end
