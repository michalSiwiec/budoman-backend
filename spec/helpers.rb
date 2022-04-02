# frozen_string_literal: true

module Helpers
  def load_json(path)
    JSON.parse(File.read(path)).deep_symbolize_keys
  end
end
