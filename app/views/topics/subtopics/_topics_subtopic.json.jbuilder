json.extract! topics_subtopic, :id, :content, :topic_id, :created_at, :updated_at
json.url topics_subtopic_url(topics_subtopic, format: :json)
