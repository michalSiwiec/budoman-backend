# frozen_string_literal: true

module Types
  module Custom
    class ProductCathegory < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
    end
  end
end
