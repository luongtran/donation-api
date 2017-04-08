json.extract! donation, :id, :user_id, :charity_id, :package_cost_id, :address_id, :total_price, :number_of_cartons, :is_fragile, :wimo_task_id, :created_at, :updated_at
json.attachments do
	json.array! donation.attachments, :id, :original_url, :medium_url, :thumb_url
end
json.donation_categories do 
	json.array! donation.donation_categories, :id, :cat_name
end

