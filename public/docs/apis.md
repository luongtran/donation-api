## API documentation (Draft)
- Version: 1.1
- Last update: 2016-05-07

## I. Conventions
  - The HTTP(or HTTPS) protocol will be used for communication between a client side and the server.
  - Uses UTF-8 character encoding. Request headers should include a Content-Type of application/json; charset=utf-8
  - All the responses will be in JSON format.
  - All timestamps are ISO-8601 formatted.
  - All responses from API will be `200 OK` even a server error is occurred. Client side should check `http_status_code` and `error code` to know exactly what happened.

## II. Authentication
To authenticate against backend server, client side need an access token. To receive it, client side make a request to login API. The access token should be included in header of requests which required authorization. Each access token has a expire time and can be revoked anytime.

## III. Errors Handling
  Codes in the 4xx range indicate an error that failed given the information provided (e.g., parameters is not pass validation, access token expired, ...), and codes in the 5xx range indicate an error from server.
  However, not all errors map cleanly onto HTTP response codes, so there is some our own error codes to indicate special states: access token expired, server maintenance ...
  The bellow list is all the error codes from server:

  - `BAD_PARAMETERS` : Some parameters are not passes validations. It usually cause from user inputs.
  - `ACCESS_TOKEN_INVALID`: User access token is not valid or expired. Client side should re-authenticate to get new access token.
  - `BAD_REQUEST`: The request form is illegal or not in expected format from server. It usually a technical problem with client side.
  - `UNAUTHORIZED`: When server failed to find user with given credentials.
  - `ACCESS_DENINED`: The request is not allowed due to user do not have permission to access a resource or post some changes.
  - `RESOURCE_NOT_FOUND`: The request asked for a resource which not exists or has been deleted from server.
  - `ENDPOINT_NOT_EXISTS`: The requested path does not exists, or cannot handler by any endpoint. It might in the case HTTP method is invalid.
  - `SERVER_ERROR`: When an unhandled error occurred. AKA technical problem.
  - `SERVER_MAINTENANCE`: Server maintenance now in progress, it might for deployment.

## IV. API Endpoints
### Register
