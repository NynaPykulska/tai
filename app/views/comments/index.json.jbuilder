json.array!(@comments) do |comment|
  json.extract! comment, :id, :artist, :title, :comment, :author
  json.url comment_url(comment, format: :json)
end
