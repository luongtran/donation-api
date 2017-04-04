class ApplicationController < ActionController::Base
  include Api::ErrorRenderer
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_not_found
  end

  protected

  def paging_params
    params[:page] ||= 1
    params[:per] ||= 20
    params
  end

  def render_not_found
    respond_to do |format|
      format.html { render 'errors/not_found', status: 404 }
      format.js { render json: { error: "Record not found" }, status: 404 }
      format.json { render_error Api::Status::RESOURCE_NOT_FOUND }
    end
  end

  def after_sign_in_path_for(resource)
    case resource.role
    when 'admin'
      backend_dashboard_path
    when 'user','customer'
      backend_profile_path
    else
      root_path
    end
  end

  def after_confirmation_path_for(resource_name, resource)
    if signed_in?(resource_name)
      signed_in_root_path(resource)
    else
      welcome_path
    end
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

  def set_layout
    devise_controller? ? 'devise' : 'application'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:email, :password, :password_confirmation, :name, :surname,
        :company_name, :organisation, :website])
    devise_parameter_sanitizer.permit(:sign_in,
      keys: [:email, :password, device: [:os, :token]])
  end

  def log_server_error(e, additional_info = {})
    error_log = "[Error]: #{e.class} : #{e.message}\n"
    error_log << "Remote IP: #{request.remote_ip}\n"
    error_log << "URL: #{request.fullpath}\n"
    additional_info.each do |k, v|
      error_log << "#{k}: #{v}\n"
    end
    error_log << e.backtrace.join("\n")
    Logger.new('log/server_error.log').info(error_log)
  end
end
