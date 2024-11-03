# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Filtrations
        module Opinions
          class OpinionInput < Types::BaseInputObject
            argument :pagination, PaginationInput, required: false
          end
        end
      end
    end
  end
end
