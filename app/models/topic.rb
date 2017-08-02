class Topic < ApplicationRecord
  validates :name,
            presence: true,
            length: { maximum: 20 }

  validates_presence_of :category_id

  belongs_to :category
  has_many :activities
  has_many :subtopics,
           dependent: :destroy,
           class_name: 'Topics::Subtopic'
end
