json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :opening_day, :teaser, :user_id, :slug
  json.url movie_url(movie, format: :json)
end
