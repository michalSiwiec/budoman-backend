# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Mutations
        module Users
          class UpdateAvatarInput < Types::BaseInputObject
            argument :main, Boolean, required: true
            argument :storage_path, String, required: true
          end
        end
      end
    end
  end
end
