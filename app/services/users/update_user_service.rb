module Users
  class UpdateUserService < BaseService
    def initialize(params:)
      super()
      @user_id = params.fetch(:user_id)
      @attributes_to_update = params.except(:user_id)
    end

    def call
      user = find_user
      update_user_attribute(user: user)
      user
    end

    private

    def find_user
      User.find(@user_id)
    end

    def update_user_attribute(user:)
      user.update!(@attributes_to_update)
    end
  end
end
