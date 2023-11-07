require 'avro_turf/messaging'

class AvroSingleton
  include Singleton

  def initialize
    @avro = AvroTurf::Messaging.new(registry_url: ENV['SCHEMA_REGISTRY_URL'])
  end

  def encode(payload:, subject:, version: 1, validate: true)
    @avro.encode(payload, subject: subject, version: version, validate: validate)
  end
end
