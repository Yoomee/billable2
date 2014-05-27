json.array!(@clients) do |client|
  json.extract! client, :id, :name, :description
  json.url client_url(client, format: :json)
end
