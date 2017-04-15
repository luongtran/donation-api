class SyncDonationJobJob < ApplicationJob
  queue_as :urgent
  require 'httparty'

  BASE_API_URL = 'http://be.wimo.ae:3000/api/v1/tasks'

  def perform(*donation)
  	params = request_body(donation)
  	headers = request_header
  	response = HTTParty.post(BASE_API_URL, body: params, headers: headers)
  	logger.info(response)
  	if(response.success?)
  		resBody = JSON.parse(response.body) 
  		if resBody.success || resBody == 1
  			donation.wimo_task_id = response.task.id
  			donation.sync_status = true
  		end
  	else
  		donation.sync_status = false
  	end
  	donation.save!
  end

  private
	def request_header
		{"authorization" => "42f824aa22ff7db6d904c43943aef9ed", "Content-Type": "application/json"}
	end

	def request_body(donation)
		address = donation.address
		address_arr = address.address_line1.split(",")
		donationParam = {
		  ownerId: 1667,
		  fulfillerId: 1667,
		  details:"Donation Order",
		  address: {
		    address: address.address_line1,
		    city: address.city,
		    area: address.area,
		    country: address.country,
		    streetNumber: address_arr.empty? ? address_arr[0] : 0,
		    streetName: address.address_line1,
		    lat: address.lat,
		    lng: address.lon
		  },
		  customer: {
		    name: donation.user.fullname,
		    phone: donation.user.phone
		  },
		  pickupTask: true,
		  totalPrice: donation.total_price,
		  paymentTypeId: 1
		}
		donationParam.to_json
	end

end
