json.array!(@topics) do |topic|
  json.extract! topic, :id, :user_id, :title, :content, :hits, :like
  json.url topic_url(topic, format: :json)
end
