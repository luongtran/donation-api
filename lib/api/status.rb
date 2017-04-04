module Api
  module Status
    # Some parameters missing or not passes validations
    BAD_PARAMETERS = 'BAD_PARAMETERS'

    # The request form is illegal or not in expected format from API
    BAD_REQUEST = 'BAD_REQUEST'

    # User access token is not valid or expire
    ACCESS_TOKEN_INVALID  = 'ACCESS_TOKEN_INVALID'

    # System coud not find user by given credentials, e.g: provider wrong email and password
    # or wrong access token
    UNAUTHORIZED = 'UNAUTHORIZED'

    # Although authentication succeeded, the user is not allowed to see the information
    # or the action is not permitted
    ACCESS_DENINED = 'ACCESS_DENINED'

    # If a resource if not found
    RESOURCE_NOT_FOUND = 'RESOURCE_NOT_FOUND'

    # If requested path does not exists, and cannot handler by any endpoint
    # It might in the case HTTP method is invalid
    ENDPOINT_NOT_EXISTS = 'ENDPOINT_NOT_EXISTS'

    # An unhandled error occured. AKA technical problem.
    SERVER_ERROR = 'SERVER_ERROR'

    # Server maintenance now in progress, it might for deployment.
    SERVER_MAINTENANCE = 'SERVER_MAINTENANCE'

    # Mapping API error codes with http status code
    ERROR_CODE_TO_HTTP_STATUS_CODE = {
      BAD_PARAMETERS        => 400,
      BAD_REQUEST           => 400,
      ACCESS_TOKEN_INVALID  => 401,
      UNAUTHORIZED          => 401,
      ACCESS_DENINED        => 403,
      RESOURCE_NOT_FOUND    => 404,
      ENDPOINT_NOT_EXISTS   => 404,
      SERVER_ERROR          => 500,
      SERVER_MAINTENANCE    => 503
    }
  end
end
