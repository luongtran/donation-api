json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('addresses.get.success')
json.address do
json.partial! "address", address: @address
end

