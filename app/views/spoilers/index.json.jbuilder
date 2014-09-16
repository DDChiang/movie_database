json.array!(@spoilers) do |spoiler|
  json.extract! spoiler, :id, :movie_id, :user_id, :synopsis
  json.url spoiler_url(spoiler, format: :json)
end
