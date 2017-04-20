class Backend::DashboardController < Backend::BaseController
  before_action :authenticate_user!

  def index
  	@total_donations = Donation.all.count
  	@total_users = User.all.count
  	@total_charities = Charity.all.count
  end
end
