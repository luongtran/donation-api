json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('addresses.get.success')
json.data do
  json.addresses do
    json.array! @addresses do |address|
      json.partial! "api_v1_addresses/_address", address: @address
    end
  end
end


