class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :court
  has_many :reservations
end
