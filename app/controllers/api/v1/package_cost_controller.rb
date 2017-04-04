class Api::V1::PackageCostController < Api::BaseController
	before_action :authenticate_user!, only: [:index]

	def index
		@package_costs = PackageCost.all
	end
end