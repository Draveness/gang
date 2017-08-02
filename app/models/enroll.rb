class Enroll < ApplicationRecord
  validates_presence_of :user
  validates_presence_of :activity
end
