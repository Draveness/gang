json.extract! topic_subtopic, :id, :content, :topic_id, :created_at, :updated_at
json.url topic_subtopic_url(topic_subtopic.topic_id, topic_subtopic, format: :json)
