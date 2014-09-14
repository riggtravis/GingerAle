json.array!(@courses) do |course|
  json.extract! course, :id, :name, :term, :subject, :listing, :user_id
  json.url course_url(course, format: :json)
end
