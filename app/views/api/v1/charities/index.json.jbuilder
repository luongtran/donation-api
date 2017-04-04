json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('charities.get.success')
json.data do
  json.charities do
    json.array! @charities do |charity|
      json.extract! charity, :id, :name, :status
    end
  end
end