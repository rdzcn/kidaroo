class Booking < ApplicationRecord
  belongs_to :user
  has_one :review
  belongs_to :event
  monetize :amount_cents
end
