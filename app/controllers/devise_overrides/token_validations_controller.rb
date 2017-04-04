class DeviseOverrides::TokenValidationsController < DeviseTokenAuth::TokenValidationsController

  protected

  def render_validate_token_success
    render_success I18n.t('devise.failure.already_authenticated') do |json|
      json[:data] = resource_data(resource_json: @resource.token_validation_response)
    end
  end

  def render_validate_token_error
    render_error Api::Status::UNAUTHORIZED, I18n.t("devise.failure.unauthenticated")
  end

end
