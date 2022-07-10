# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      class LogoutUserInput < Types::BaseInputObject
        argument :id, ID, required: true
      end
    end
  end
end
