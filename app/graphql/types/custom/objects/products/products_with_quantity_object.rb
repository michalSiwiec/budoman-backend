# frozen_string_literal: true

module Types
  module Custom
    module Objects
      module Products
        class ProductsWithQuantityObject < Types::BaseObject
          field :products, [ProductObject], null: false
          field :quantity, Integer, null: false
        end
      end
    end
  end
end
