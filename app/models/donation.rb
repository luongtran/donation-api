class Donation < ApplicationRecord
	has_many :attachments, as: :attachmentable
	has_and_belongs_to_many :donation_categories
	belongs_to :address
	belongs_to :package_cost
	belongs_to :charity
	belongs_to :user

	accepts_nested_attributes_for :donation_categories
	accepts_nested_attributes_for :attachments, allow_destroy: true

	attr_accessor :donation_category_ids

	require 'httparty'

	  BASE_API_URL = 'http://be.wimo.ae:3000/api/v1/tasks'

	  def sync_task
	  	donation = self
	  	params = request_body(donation)
	  	logger.info(params)
	  	headers = request_header
	  	response = HTTParty.post(BASE_API_URL, body: params.to_json, headers: headers)
	  	response = JSON.parse(response.body)
	  	logger.info "response success #{response.success}"
	  	if(response.success?)
  			donation.wimo_task_id = response.task.id
  			donation.sync_status = true
	  	else
	  		donation.sync_status = false
	  	end
	  	donation.save!
	  end

	  private
		def request_header
			{"authorization": "42f824aa22ff7db6d904c43943aef9ed", "Content-Type": "application/json"}
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
			donationParam
		end

end
