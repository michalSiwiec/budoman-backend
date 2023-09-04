module Utils
  module ParamsParser
    def convert_string_to_hash(string:)
      string.split
            .map { |s| s.split(':') }
            .to_h
            .symbolize_keys
    end
  end
end
