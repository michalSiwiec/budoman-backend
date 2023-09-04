module Monitoring
  class ValidateAndEncodePayloadService < BaseService
    PayloadNotValidError = Class.new(RollbarError)

    def initialize(payload:)
      super()
      @payload = payload
    end

    def call
      ::AvroSingleton.instance.encode(payload: @payload, schema_name: 'monitor_resource')
    rescue StandardError => e
      raise PayloadNotValidError.new(message: e.message, context_data: { payload: @payload })
    end
  end
end
