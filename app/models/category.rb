class Category < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: true,
            length: { maximum: 10 }

  has_many :topics
end
