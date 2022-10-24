# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Mutations
        class ChangeUserPasswordInput < Types::BaseInputObject
          argument :password, String, required: true
          argument :id, ID, required: true
        end
      end
    end
  end
end
