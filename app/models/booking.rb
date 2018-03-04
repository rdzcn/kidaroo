class Booking < ApplicationRecord
  belongs_to :user
  has_one :review, dependent: :destroy
  belongs_to :event
  monetize :amount_cents

  # def total_amount_cents
  #   amount_cents * quantity
  # end
end
