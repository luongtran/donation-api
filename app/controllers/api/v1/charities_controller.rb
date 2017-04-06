class Api::V1::CharitiesController < Api::BaseController
	before_action :authenticate_user!, only: [:index]

	def index
		if params[:charity_location_id]
			@charities = Charity.where(charity_location_id: params[:charity_location_id], status: true)
		else
			@charities = Charity.where(status: true)
		end
		
	end
end