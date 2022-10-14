# frozen_string_literal: true

class BaseBuilder
  def self.build(*args)
    new(*args).build
  end
end
