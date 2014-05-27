json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :client_id
  json.url project_url(project, format: :json)
end
