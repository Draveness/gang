class Tag < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, maximum: 10
end
