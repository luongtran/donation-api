json.extract! donation, :id, :user_id, :charity_id, :package_cost_id, :address_id, :total_price, :number_of_cartons, :is_fragile, :wimo_task_id, :created_at, :updated_at
json.attachments do
	json.array! donation.attachments, :id, :original_url, :medium_url, :thumb_url
end
json.donation_categories do 
	json.array! donation.donation_categories, :id, :cat_name
end
if !donation.address.nil?
	json.address do
		json.extract! donation.address, :id, :address_fullname, :flat_building_number, :address_line1, :address_instruction, :lat, :lon
	end
end

if !donation.charity.nil?
	json.charity do
		json.extract! donation.charity, :id, :name
	end
end

if !donation.package_cost.nil?
	json.package_cost do
		json.extract! donation.package_cost, :id, :package_size, :cost_per_carton
	end
end

json.courier_cost @courier_cost

