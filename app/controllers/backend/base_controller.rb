class Backend::BaseController < ApplicationController
  layout 'backend'
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do
    redirect_to backend_profile_path, alert: 'Your dont have permission to view this page'
  end
end
