class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :court
  has_many :reservations

  has_one_attached :photo

  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :capacity, presence: true

  validate :date_validation
  validates :start_time, presence: true
  validates :end_time, presence: true

  def date_validation
    if self[:end_time] < self[:start_time]
      errors[:end_time] << "Please make sure that start date is before end date"
      return false
    else
      return true
    end
  end
end
