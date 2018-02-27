class Activity < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :bookings, through: :events
  has_many :reviews, through: :bookings


  # validates :title, presence: true
  # validates :description, presence: true
  # validates :address, presence: true
  # validates :category, presence: true

  monetize :price_cents


end
