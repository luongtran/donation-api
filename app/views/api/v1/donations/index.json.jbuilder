json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('donations.get.success')
json.donations do
	json.array! @donations do |donation|
	  json.partial! "donation", donation: donation
	end
end
