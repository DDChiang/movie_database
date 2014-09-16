json.array!(@directors) do |director|
  json.extract! director, :id, :first, :last, :slug, :approved, :birthday
  json.url director_url(director, format: :json)
end
