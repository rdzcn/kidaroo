class Provider < ApplicationRecord
  has_many :activities
  has_many :events, through: :activities
  has_many :bookings, through: :events
  has_many :reviews, through: :bookings
end
