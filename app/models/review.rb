class Review < ApplicationRecord
  belongs_to :user
  belongs_to :court

  validates :title, presence: true
  validates :rating, presence: true, numericality: { in: 1..5 }

  def average_rating
    sum = []
    number = 0

    court.reviews.each do |f|
      sum += f.rating
      number = f.rating.count
    end

    return sum / number
  end
end
