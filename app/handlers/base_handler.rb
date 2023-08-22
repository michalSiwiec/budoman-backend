class BaseHandler
  def initialize(next_handler = nil)
    @next_handler = next_handler
  end

  def call(handler_context:)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
