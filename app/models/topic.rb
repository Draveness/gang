class Topic < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :category_id
  validates_length_of :name, maximum: 20

  belongs_to :category
  has_many :subtopics, dependent: :destroy
end
