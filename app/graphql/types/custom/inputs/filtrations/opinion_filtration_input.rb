# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Filtrations
        class OpinionFiltrationInput < Types::BaseInputObject
          argument :pagination, PaginationInput, required: false
        end
      end
    end
  end
end
