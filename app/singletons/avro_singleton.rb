class AvroSingleton
  include Singleton

  def initialize
    @avro = AvroTurf.new(schemas_path: 'app/avro')
  end

  def encode(payload:, schema_name:, validate: true)
    @avro.encode(payload, schema_name: schema_name, validate: validate)
  end
end
