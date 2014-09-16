json.array!(@users) do |user|
  json.extract! user, :id, :uid, :provider, :chosen_name, :description
  json.url user_url(user, format: :json)
end
