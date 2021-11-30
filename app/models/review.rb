class Review < ApplicationRecord
  belongs_to :user
  belongs_to :court

  validates :title, presence: true
  validates :rating, presence: true, numericality: { in: 1..5 }

end
