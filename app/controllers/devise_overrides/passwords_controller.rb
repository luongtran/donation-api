class DeviseOverrides::PasswordsController < DeviseTokenAuth::PasswordsController

  protected

  def render_create_error_missing_email
    render_bad_params I18n.t("devise_token_auth.passwords.missing_email")
  end

  def render_create_error_missing_redirect_url
    render_bad_params I18n.t("devise_token_auth.passwords.missing_email")
  end

  def render_create_error_not_allowed_redirect_url
    render_bad_params I18n.t("devise_token_auth.passwords.not_allowed_redirect_url", redirect_url: @redirect_url)
  end

  def render_create_success
    render_success I18n.t("devise_token_auth.passwords.sended", email: @email)
  end

  def render_create_error
    render_error Api::Status::RESOURCE_NOT_FOUND, nil, @errors
  end

  def render_update_error_unauthorized
    render_error  Api::Status::UNAUTHORIZED, 'Unauthorized'
  end

  def render_update_error_password_not_required
    render_bad_params I18n.t("devise_token_auth.passwords.password_not_required", provider: @resource.provider.humanize)
  end

  def render_update_error_missing_password
    render_bad_params I18n.t("devise_token_auth.passwords.missing_passwords")
  end

  def render_update_success
    render_success I18n.t("devise_token_auth.passwords.successfully_updated") do |json|
      json[:data] = resource_data
    end
  end

  def render_update_error
    render_bad_params
  end

end
