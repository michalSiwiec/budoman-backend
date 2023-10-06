module RequestHelper
  def parse_request_body
    JSON.parse(response.body).deep_symbolize_keys
  end
end
