class Provider < ApplicationRecord
  has_many :activities
  has_many :bookings, through: :activities
end
