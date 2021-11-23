class AdminRequest < ApplicationRecord
  belongs_to :court
  belongs_to :user

  validates :action, presence: true
end
