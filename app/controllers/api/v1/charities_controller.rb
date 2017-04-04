class Api::V1::CharityController < Api::BaseController
	before_action :authenticate_user!, only: [:index]

	def index
		if param[:charity_location_id]
			@charities = Charity.where(charity_location_id: param[:charity_location_id], status: true)
		else
			@charities = Charity.where(status: true)
		end
		
	end
end