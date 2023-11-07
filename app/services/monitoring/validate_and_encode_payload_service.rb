module Monitoring
  class ValidateAndEncodePayloadService < BaseService
    SchemaNotFoundError = Class.new(RollbarError)
    PayloadNotValidError = Class.new(RollbarError)

    def initialize(payload:)
      super()
      @payload = payload
    end

    def call
      ::AvroSingleton.instance.encode(payload: @payload, subject: 'monitor_resources')
    rescue AvroTurf::SchemaNotFoundError => e
      raise SchemaNotFoundError.new(message: e.message, context_data: { subject: 'monitor_resources' })
    rescue Avro::SchemaValidator::ValidationError => e
      raise PayloadNotValidError.new(message: e.message, context_data: { payload: @payload })
    end
  end
end
