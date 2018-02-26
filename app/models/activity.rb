class Activity < ApplicationRecord
  belongs_to :provider
  has_many :bookings
  has_many :reviews, through: :bookings
end
