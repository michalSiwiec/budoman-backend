# frozen_string_literal: true

module Types
  module Custom
    module Objects
      module Products
        class ProductWithAllQuantityObject < Types::BaseObject
          field :products, [ProductObject], null: false
          field :all_products_quantity, Integer, null: false
        end
      end
    end
  end
end
