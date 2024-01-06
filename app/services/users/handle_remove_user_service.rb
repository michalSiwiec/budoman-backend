module Users
  class HandleRemoveUserService < BaseService
    def initialize(user_id:, session:)
      super()
      @user = User.find(user_id)
      @session = session
    end

    def call
      unsubsribe_user_from_newsletter
      clean_user_storage_object
      destroy_user_session
      destroy_user
      @user
    end

    private

    def unsubsribe_user_from_newsletter
      ::Newsletters::UnsubscribeFromNewsletterService.call(email: @user.email)
    end

    def clean_user_storage_object
      ::Users::CleanStorageObjectsService.call(user: @user)
    end

    def destroy_user_session
      ::Users::SessionUserService.new(session: @session, user: @user).destroy
    end

    def destroy_user
      ::Users::DestroyUserService.call(user: @user)
    end
  end
end
