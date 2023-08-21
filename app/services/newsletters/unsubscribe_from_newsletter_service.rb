module Newsletters
  class UnsubscribeFromNewsletterService
    def initialize(email:)
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
