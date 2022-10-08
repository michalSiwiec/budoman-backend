# frozen_string_literal: true

module Types
  module Custom
    module Objects
      class AvatarObject < Types::BaseObject
        field :main, Boolean, null: false
        field :storage_path, String, null: false
      end
    end
  end
end
