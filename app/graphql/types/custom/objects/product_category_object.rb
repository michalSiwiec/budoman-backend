# frozen_string_literal: true

module Types
  module Custom
    module Objects
      class ProductCategoryObject < Types::BaseObject
        field :id, ID, null: false
        field :name, String, null: false
      end
    end
  end
end
