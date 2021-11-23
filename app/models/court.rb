class Court < ApplicationRecord
  has_many :reviews
  has_many :check_ins
  has_many :messages
  has_many :admin_requests
  has_many :lessons
  belongs_to :court_type
  belongs_to :user

  validates :address, presence: true
end
