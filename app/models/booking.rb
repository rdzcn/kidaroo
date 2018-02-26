class Booking < ApplicationRecord
  belongs_to :user
  has_many :reviews
  belongs_to :activity
end
