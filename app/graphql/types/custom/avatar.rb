# frozen_string_literal: true

module Types
  module Custom
    class Avatar < Types::BaseObject
      field :main, Boolean, null: false
      field :storage_path, String, null: false
    end
  end
end
