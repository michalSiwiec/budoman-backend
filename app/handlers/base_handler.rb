# frozen_string_literal: true

class BaseHandler
  def self.handle(*args)
    new(*args).handle
  end
end
