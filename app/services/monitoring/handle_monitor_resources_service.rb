module Monitoring
  class HandleMonitorResourcesService < BaseService
    def initialize(params:)
      super()
      @params = params
    end

    def call
      payload = build_payload
      encoded_payload = validate_and_encode_payload(payload: payload)
      publish_event(payload: encoded_payload)
      handle_success
    rescue StandardError => e
      handle_error(error: e)
    end

    private

    def build_payload
      ::Monitoring::MonitorResourcesBuilder.build(params: @params)
    end

    def validate_and_encode_payload(payload:)
      ::Monitoring::ValidateAndEncodePayloadService.call(payload: payload)
    end

    def publish_event(payload:)
      ::Monitoring::PublishOnStreamPlatformService.call(payload: payload)
    end

    def handle_success
      MonitoringSystemLoggerSingleton.instance.info('Event succesfully published on stream platform!')
      true
    end

    def handle_error(error:)
      MonitoringSystemLoggerSingleton.instance.warn("Event publication failed!\n\
                                                    Context: #{error&.rollbar_context || {}}\n\
                                                    Error message: #{error.message}\n\
                                                    Error backtrace:\n#{error.backtrace.first(3).join("\n")}\n")
      Rollbar.warn(error)
      false
    end
  end
end
