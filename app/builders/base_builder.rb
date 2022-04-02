# frozen_string_literal: true

class BaseBuilder
  def self.handle(*args)
    new(*args).build
  end
end
