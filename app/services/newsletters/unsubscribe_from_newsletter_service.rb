module Newsletters
  class UnsubscribeFromNewsletterService
    extend Utils::CallableObject

    def initialize(email:)
      super()
      @email = email
    end

    def call
      unsubscribe_from_newsletter
    end

    private

    def unsubscribe_from_newsletter
      Newsletter.find_by(email: @email)&.destroy!
    end
  end
end
