class CheckIn < ApplicationRecord
  belongs_to :user
  belongs_to :court

  validate :date_validation
  validates :start_time, presence: true
  validates :end_time, presence: true

  def date_validation
    if self.end_time < self.start_time
      errors[:end_time] << "Please make sure that start date is before end date"
      return false
    else
      return true
    end
  end

  # def current_check_ins
  #   where("start_time >= :start", start: start_time).and("end_time <= :end", end: end_time)
  # end
end
