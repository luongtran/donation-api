class Api::V1::CourierCostController < Api::BaseController
	before_action :authenticate_user!, only: [:index]

	def index
		all = CourierCost.all
		@courier_cost = !all.empty? all[0] : 0
	end
end