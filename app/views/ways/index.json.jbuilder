json.array!(@ways) do |way|
  json.extract! way, :id, :limit_time, :origin
  json.url way_url(way, format: :json)
end
