class Topics::Subtopic < ApplicationRecord
  validates_presence_of :content, :topic_id
  belongs_to :topic
end
