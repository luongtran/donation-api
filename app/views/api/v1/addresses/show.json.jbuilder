json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('addresses.get.success')
json.data do
  json.address do
    json.partial! "address", address: @address
  end
end
