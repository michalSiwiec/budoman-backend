# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Mutations
        class UpdateAvatarInput < Types::BaseInputObject
          argument :main, Boolean, required: true
          argument :storage_path, String, required: true
        end
      end
    end
  end
end
