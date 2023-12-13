module Users
  class HandleRemoveUserService < BaseService
    def initialize(user_id:, session:)
      super()
      @user_id = user_id
      @session = session
    end

    def call
      user = User.find(@user_id)
      composite = ::BaseComposite.new
      composite.add_task(task: ::Newsletters::UnsubscribeFromNewsletterService.new(email: user.email))
      composite.add_task(task: ::Users::CleanStorageObjectsService.new(user: user))
      composite.add_task(task: ::Users::DestroyUserSessionAdapter.new(session: @session, user: user))
      composite.add_task(task: ::Users::DestroyUserService.new(user: user))
      composite.call
      user
    end
  end
end
