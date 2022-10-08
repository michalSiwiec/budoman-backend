# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Filtrations
        class PaginationInput < Types::BaseInputObject
          argument :page, Integer, required: true
          argument :quantity_per_page, Integer, required: true
        end
      end
    end
  end
end
