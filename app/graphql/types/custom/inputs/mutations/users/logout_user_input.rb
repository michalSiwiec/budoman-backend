# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Mutations
        module Users
          class LogoutUserInput < Types::BaseInputObject
            argument :id, ID, required: true
          end
        end
      end
    end
  end
end
