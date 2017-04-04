class Api::V1::CharityLocationsController < Api::BaseController
	before_action :authenticate_user!, only: [:index]

	def index
		@charity_locations = CharityLocation.where(status: true)
	end
end