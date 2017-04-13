class Api::V1::PackageCostsController < Api::BaseController
	before_action :authenticate_user!, only: [:index]

	def index
		courier_cost = CourierCost.first 
		@courier_cost = !courier_cost.nil? ? courier_cost.cost : 30;
		@package_costs = PackageCost.all
	end
end