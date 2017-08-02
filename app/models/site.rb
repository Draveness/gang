class Site < ApplicationRecord
  validates :name,
            presence: true

  validates :latitude,
            presence: true
  validates :longitude,
            presence: true

  has_many :activities
end
