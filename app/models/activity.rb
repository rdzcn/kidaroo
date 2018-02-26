class Activity < ApplicationRecord
  belongs_to :provider
  has_many :events
  has_many :bookings, through: :events
  has_many :reviews, through: :bookings
  monetize :price_cents

end
