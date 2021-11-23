class CourtType < ApplicationRecord
  has_many :courts

  validates :name, presence: true
end
