class Court < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  has_many :reviews
  has_many :check_ins, dependent: :destroy
  has_many :messages
  has_many :admin_requests
  has_many :lessons, dependent: :destroy
  belongs_to :court_type
  belongs_to :user

  validates :address, presence: true

  def current_check_ins
    check_ins.select { |a| a.start_time < Time.now && a.end_time > Time.now }
  end
end
