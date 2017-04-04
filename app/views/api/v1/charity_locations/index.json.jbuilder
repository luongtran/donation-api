json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('chairty_locations.get.success')
json.data do
  json.charity_locations do
    json.array! @charity_locations do |charity_location|
      json.extract! charity_location, :id, :location_name, :status
    end
  end
end