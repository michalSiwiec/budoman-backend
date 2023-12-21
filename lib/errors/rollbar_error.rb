module Errors
  class RollbarError < StandardError
    attr_reader :rollbar_context

    def initialize(message:, context_data: {})
      super(message)
      @rollbar_context = context_data
    end
  end
end
