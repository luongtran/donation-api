RSpec::Matchers.define :be_api_success do
  match do |response|
    json_res = JSON.parse(response.body, symbolize_names: true)
    (json_res[:http_status_code] == 200) && !json_res.has_key?(:error)
  end
end

RSpec::Matchers.define :be_api_error do |error_code|
  match do |response|
    json_res = JSON.parse(response.body, symbolize_names: true)
    (json_res[:http_status_code] != 200) &&
      json_res.has_key?(:error) &&
      (json_res[:error][:code] == error_code)
  end
end
