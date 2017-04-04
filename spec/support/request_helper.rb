module Request
  module Helper
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end

    def http_status_code
      json_response[:http_status_code]
    end

    def error_code
      json_response[:error][:code]
    end

    def error_response
      json_response[:error]
    end

    def set_api_user(user)
      auth_headers = user.create_new_auth_token
      request.headers['access-token'] = auth_headers['access-token']
      request.headers['client'] = auth_headers['client']
      request.headers['uid'] = auth_headers['uid']
    end
  end
end
