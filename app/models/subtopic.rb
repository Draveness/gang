class Subtopic < ApplicationRecord
  validates_presence_of :content
  validates_length_of :content, maximum: 100
  belongs_to :topic
end
