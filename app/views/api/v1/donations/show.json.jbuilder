json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('donations.detail.success')
json.data do
  json.donation do
    json.partial! "donation", donation: @donation
  end
end

