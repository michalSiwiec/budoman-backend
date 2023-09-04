class KafkaProducerSingleton
  include Singleton

  def initialize
    @producer = WaterDrop::Producer.new

    @producer.setup do |config|
      config.deliver = true
      config.logger = MonitoringSystemLoggerSingleton.instance
      config.kafka = {
        'bootstrap.servers': 'kafka:9092',
        'request.required.acks': 'all',
        'enable.idempotence': true
      }
    end
  end

  def produce(topic:, payload:)
    @producer.produce_sync(topic: topic, payload: payload)
  end
end
