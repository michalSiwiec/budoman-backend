# frozen_string_literal: true

module Regex
  module User
    EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
    PASSWORD = /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}\z/i.freeze
  end
end
