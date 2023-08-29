# frozen_string_literal: true

module Users
  class SessionUserService
    JWT_PASSWORD = nil
    JWT_SIGNING = 'none'
    JWT_VALIDATION = false

    def initialize(session:, user: nil)
      @user = user
      @session = session
    end

    def login
      save_user_token_to_session
    end

    def current_user
      return unless @session.fetch(:user_token, nil)

      find_user_by_id
    end

    def destroy
      @session.destroy
    end

    private

    def save_user_token_to_session
      @session[:user_token] = user_token
    end

    def user_token
      JWT.encode(@user.id, JWT_PASSWORD, JWT_SIGNING)
    end

    def find_user_by_id
      User.find(user_id)
    end

    def user_id
      JWT.decode(@session.fetch(:user_token), JWT_PASSWORD, JWT_VALIDATION).first
    end
  end
end
