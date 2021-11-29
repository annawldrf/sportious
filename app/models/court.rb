class Court < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  has_many :reviews
  has_many :check_ins, dependent: :destroy
  has_many :messages
  has_many :admin_requests
  has_many :lessons
  belongs_to :court_type
  belongs_to :user

  validates :address, presence: true

  def current_check_ins
    check_ins.select { |a| a.start_time < Time.now && a.end_time > Time.now }
  end

  def average_rating
    sum = 0
    number = []
    average = 0

    reviews.each do |f|
      sum += f.rating.to_f.round(1)
      number.push(f)
      average = sum / number.count.to_f.round(1)
    end

    return average
  end

  def stars
    average_rating.round
  end

'  def stars(rating)
    zero_star_icon_name = "star"
    full_star_icon_name = "star_fill"
    half_star_icon_name = "star_lefthalf_fill"
    rating_round_point5 = (rating * 2).round / 2.0

    (1..5).map do |i|
      next(full_star_icon_name) if i <= rating_round_point5
      next(half_star_icon_name) if rating_round_point5 + 0.5 == i
      zero_star_icon_name
    end
  end'
end
