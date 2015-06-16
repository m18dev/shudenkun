json.array!(@interferences) do |interference|
  json.extract! interference, :id, :target_user
  json.url interference_url(interference, format: :json)
end
