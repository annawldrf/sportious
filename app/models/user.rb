class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :check_ins
  has_many :messages
  has_many :lessons
  has_many :reservations
  has_many :admin_requests
  has_many :courts
end
