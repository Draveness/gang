class Site < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :longitude
  validates_presence_of :latitude
end
