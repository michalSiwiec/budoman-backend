# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Mutations
        module Orders
          class ProductsOrderInput < Types::BaseInputObject
            argument :product_id, ID, required: true
            argument :product_quantity, Integer, required: true
          end
        end
      end
    end
  end
end
