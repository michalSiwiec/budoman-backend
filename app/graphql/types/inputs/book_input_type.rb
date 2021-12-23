module Types
  module Inputs
    class BookInputType < Types::BaseInputObject
      argument :title, String, required: false
    end
  end
end
