# frozen_string_literal: true

module Graphql
  class LogoutUserHandler < BaseHandler
    def initialize(params:, session:)
      super()
      @params = params
      @session = session
    end

    def handle
      logout_user
      user
    end

    private

    def logout_user
      @session[:token] = nil
    end

    def user
      User.find_by(@params)
    end
  end
end
