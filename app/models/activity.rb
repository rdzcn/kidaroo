class Activity < ApplicationRecord
  belongs_to :provider
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :category, presence: true
end
