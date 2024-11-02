# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Mutations
        module Users
          class RegisterAvatarInput < Types::BaseInputObject
            argument :main, Boolean, required: true
            argument :base64, String, required: true
            argument :file_name, String, required: true
            argument :file_type, String, required: true
          end
        end
      end
    end
  end
end
