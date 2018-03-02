class Booking < ApplicationRecord
  belongs_to :user
  has_one :review
  belongs_to :event
  monetize :amount_cents

  # def total_amount_cents
  #   amount_cents * quantity
  # end
end
