json.array!(@ratings) do |rating|
  json.extract! rating, :id, :numeric_rating, :comments, :date, :user_id, :group_id
  json.url rating_url(rating, format: :json)
end
