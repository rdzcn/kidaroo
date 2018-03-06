class Event < ApplicationRecord
  has_many :bookings
  has_many :messages
  belongs_to :activity
  has_many :reviews, through: :bookings
  has_many :users, through: :messages
end
