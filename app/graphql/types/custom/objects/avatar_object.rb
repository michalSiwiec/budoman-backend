# frozen_string_literal: true

module Types
  module Custom
    module Objects
      class AvatarObject < Types::BaseObject
        field :main, String, null: false
        field :storage_path, String, null: false
      end
    end
  end
end
