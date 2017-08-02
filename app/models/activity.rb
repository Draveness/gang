class Activity < ApplicationRecord
  validates :time,
            presence: true
  validates :content,
            presence: true,
            length: { maximum: 200 }

  validates_presence_of :site_id
  validates_presence_of :topic_id

  belongs_to :site
  belongs_to :topic
  has_many :users
end
