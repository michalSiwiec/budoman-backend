# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Mutations
        class UpdateUserInput < Types::BaseInputObject
          argument :user_id, ID, required: true
          argument :name, String, required: false
          argument :surname, String, required: false
          argument :phone_number, String, required: false
          argument :street, String, required: false
          argument :city, String, required: false
          argument :postal_code, String, required: false
        end
      end
    end
  end
end
