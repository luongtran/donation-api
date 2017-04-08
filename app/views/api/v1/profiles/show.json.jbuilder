json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('profiles.get.success')
json.data do
  json.profile do
    json.extract! current_user, :id, :fullname, :email, :phone
  end
end
