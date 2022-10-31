# frozen_string_literal: true

class UnsubscribeUserFromNewsletterHandler < BaseHandler
  def initialize(user_email)
    super()
    @user_email = user_email
  end

  def handle
    unsubscribe_from_newsletter
  end

  private

  def unsubscribe_from_newsletter
    newsletter.destroy!
  end

  def newsletter
    Newsletter.find_by!(email: @user_email)
  end
end
