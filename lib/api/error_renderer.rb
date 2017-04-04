require 'api/status'
module Api
  # Use for throwing technical errors
  class UnexpectedError < StandardError
  end

  # Error rendering for API
  module ErrorRenderer
    extend ActiveSupport::Concern

    def render_bad_params(message, errors = nil)
      render_error Api::Status::BAD_PARAMETERS, message, errors
    end

    def render_endpoint_not_exists
      render_error Api::Status::ENDPOINT_NOT_EXISTS
    end

    def render_invalid_access_token
      render_error Api::Status::ACCESS_TOKEN_INVALID
    end

    def render_server_error
      render_error(
        Api::Status::SERVER_ERROR,
        "An server error is occurred."
      )
    end

    def render_error(error_code, message = nil, errors = {})
      http_status_code = Api::Status::ERROR_CODE_TO_HTTP_STATUS_CODE[error_code] || 500
      message ||= "An error has occurred"
      response_body = {
        message: message,
        http_status_code: http_status_code,
        error: {
          code: error_code
        }
      }
      if errors.present?
        response_body[:errors] = errors
      end
      render json: response_body, status: 200
    end

    def render_success(message = nil)
      response_body = {
        http_status_code: 200
      }
      response_body[:message] = message if message
      if block_given?
        yield response_body
      end
      render json: response_body, status: 200
    end

  end
end
