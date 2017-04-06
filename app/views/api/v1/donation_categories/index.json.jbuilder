json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('donation_categories.get.success')
json.data do
  json.donation_categories do
    json.array! @donation_categories do |donation_category|
      json.extract! donation_category, :id, :cat_name, :status
    end
  end
end