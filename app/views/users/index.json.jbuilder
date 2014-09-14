json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :firstname, :lastname, :email, :phone, :street, :aptpo, :city, :state, :zip
  json.url user_url(user, format: :json)
end
