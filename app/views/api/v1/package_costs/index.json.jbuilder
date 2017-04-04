json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('package_cost.get.success')
json.data do
  json.package_costs do
    json.array! @package_costs do |package_cost|
      json.extract! package_cost, :id, :name, :status
    end
  end
end