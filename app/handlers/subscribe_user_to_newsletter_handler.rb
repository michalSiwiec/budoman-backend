# frozen_string_literal: true

class SubscribeUserToNewsletterHandler < BaseHandler
  def initialize(params)
    super()
    @params = params
  end

  def handle
    User.last
  end
end
