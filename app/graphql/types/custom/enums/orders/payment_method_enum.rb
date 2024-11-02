# frozen_string_literal: true

module Types
  module Custom
    module Enums
      module Orders
        class PaymentMethodEnum < Types::BaseEnum
          value 'cash_payment'
          value 'traditional_transfer'
        end
      end
    end
  end
end
