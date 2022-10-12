# frozen_string_literal: true

module Types
  module Custom
    module Enums
      class DeliveryMethodEnum < Types::BaseEnum
        value 'in_post'
        value 'dpd'
        value 'at_the_point'
      end
    end
  end
end
