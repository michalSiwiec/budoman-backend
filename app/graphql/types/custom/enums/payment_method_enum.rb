# frozen_string_literal: true

module Types
  module Custom
    module Enums
      class PaymentMethodEnum < Types::BaseEnum
        value 'traditional_transfer'
        value 'cash_on_delivery'
      end
    end
  end
end
