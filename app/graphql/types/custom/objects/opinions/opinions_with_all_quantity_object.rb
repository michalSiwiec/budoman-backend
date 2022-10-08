# frozen_string_literal: true

module Types
  module Custom
    module Objects
      module Opinions
        class OpinionsWithAllQuantityObject < Types::BaseObject
          field :opinions, [OpinionObject], null: false
          field :all_opinions_quantity, Integer, null: false
        end
      end
    end
  end
end
