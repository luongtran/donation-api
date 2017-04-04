class DeviseOverrides::SessionsController < DeviseTokenAuth::SessionsController

  def create
    super do |resource|
      if resource_params[:device]
        device = Device.find_or_create_by(token: resource_params[:device][:token])
        device.update_attributes(os: resource_params[:device][:os], user_id: resource.id)
      end
    end
  end


  def destroy
    super do |resource|
      if params[:device][:os] && params[:device][:token]
        resource.devices.where(os: params[:device][:os], token: params[:device][:token]).delete_all
      end
    end
  end

  protected

  def render_create_success
    render_success I18n.t('devise.sessions.signed_in') do |json|
      json[:data] = resource_data(resource_json: @resource.token_validation_response)
    end
  end

  def render_create_error_bad_credentials
    render_error(
      Api::Status::UNAUTHORIZED,
      I18n.t("devise.failure.invalid", authentication_keys: 'email')
      )
  end

  def render_create_error_not_confirmed
    render_error(
      Api::Status::UNAUTHORIZED,
      I18n.t("devise.failure.unconfirmed")
      )
  end

  def render_destroy_success
    render_success I18n.t('devise.sessions.signed_out')
  end

  def render_destroy_error
    render_error(
      Api::Status::RESOURCE_NOT_FOUND,
      I18n.t("devise_token_auth.sessions.user_not_found")
      )
  end
end
