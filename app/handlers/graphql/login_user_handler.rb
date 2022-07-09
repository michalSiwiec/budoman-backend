# frozen_string_literal: true

module Graphql
  class LoginUserHandler < BaseHandler
    def initialize(params:, session:)
      super()
      @params = params
      @session = session
    end

    def handle
      save_token_to_session
      user
    end

    private

    def user
      @user ||= User.find_by!(@params)
    end

    def token
      @token ||= JWT.encode(user.id, nil, 'none')
    end

    def save_token_to_session
      @session[:token] = token
    end
  end
end
