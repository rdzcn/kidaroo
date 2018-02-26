class Event < ApplicationRecord
  has_many :bookings
  belongs_to :activity
  has_many :reviews, through: :bookings
end
