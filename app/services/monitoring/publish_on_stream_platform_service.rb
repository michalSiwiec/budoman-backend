module Monitoring
  class PublishOnStreamPlatformService < BaseService
    PublishOnStreamPlatformError = Class.new(RollbarError)

    TOPIC_NAME = 'monitor_resources'.freeze

    def initialize(payload:)
      super()
      @payload = payload
    end

    def call
      ::KafkaProducerSingleton.instance.produce(topic: TOPIC_NAME, payload: @payload)
    rescue StandardError => e
      raise PublishOnStreamPlatformError.new(message: e.message, context_data: { payload: @payload })
    end
  end
end
