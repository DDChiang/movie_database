json.array!(@roles) do |role|
  json.extract! role, :id, :actor_id, :movie_id, :slug, :name
  json.url role_url(role, format: :json)
end
