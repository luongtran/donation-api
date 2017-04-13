class Api::V1::CharitiesController < Api::BaseController
	before_action :authenticate_user!, only: [:index]

	def index
		charities = Charity.where(status: true)
		puts "Charity location #{params[:charity_location_id] if params[:charity_location_id].present?}"
		charities = charities.where(charity_location_id: params[:charity_location_id]) if params[:charity_location_id].present?
		puts "search location #{params[:q] if params[:q].present?}"
		charities = charities.index_search(params[:q]) if params[:q].present?
		@charities = charities
	end
end