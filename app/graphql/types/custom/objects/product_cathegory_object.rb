# frozen_string_literal: true

module Types
  module Custom
    module Objects
      class ProductCathegoryObject < Types::BaseObject
        field :id, ID, null: false
        field :name, String, null: false
      end
    end
  end
end
