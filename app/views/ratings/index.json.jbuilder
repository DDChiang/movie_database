json.array!(@ratings) do |rating|
  json.extract! rating, :id, :user_id, :movie_id, :review, :value, :review_present
  json.url rating_url(rating, format: :json)
end
