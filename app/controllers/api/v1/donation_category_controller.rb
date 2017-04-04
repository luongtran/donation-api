class Api::V1::DonationCategoryController < Api::BaseController
	before_action :authenticate_user!, only: [:index]

	def index
		@donation_categories = DonationCategory.where(status: true)
	end
end