# frozen_string_literal: true

module Mutations
  class MonitorResourcesMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::MonitorResourcesInput, required: true
    type Boolean

    def resolve(params)
      super(params)
      ::Monitoring::HandleMonitorResourcesService.call(params: @params)
    end
  end
end
