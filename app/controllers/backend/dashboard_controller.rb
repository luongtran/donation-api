class Backend::DashboardController < Backend::BaseController
  before_action :authenticate_user!

  def index
  end
end
