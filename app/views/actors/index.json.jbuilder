json.array!(@actors) do |actor|
  json.extract! actor, :id, :first, :last, :slug, :approved, :birthday
  json.url actor_url(actor, format: :json)
end
