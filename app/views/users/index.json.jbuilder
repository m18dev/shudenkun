json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :nearest_station
  json.url user_url(user, format: :json)
end
