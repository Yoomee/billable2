json.array!(@recorded_times) do |recorded_time|
  json.extract! recorded_time, :id, :todo_list_item_id, :user_id
  json.url recorded_time_url(recorded_time, format: :json)
end
