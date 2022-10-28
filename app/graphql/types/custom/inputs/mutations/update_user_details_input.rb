# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Mutations
        class UpdateUserDetailsInput < Types::BaseInputObject
          argument :user_id, ID, required: true
          argument :name, String, required: true
          argument :surname, String, required: true
          argument :phone_number, String, required: true
          argument :street, String, required: true
          argument :city, String, required: true
          argument :postal_code, String, required: true
        end
      end
    end
  end
end
