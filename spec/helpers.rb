# frozen_string_literal: true

module Helpers
  def load_json(path)
    JSON.parse(File.read(path)).deep_symbolize_keys
  end

  def json_parser(json)
    JSON.parse(json).deep_symbolize_keys
  end

  def camelize_hash(hash)
    hash.deep_transform_keys { |key| key.to_s.camelize(:lower) }
  end
end
