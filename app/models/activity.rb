class Activity < ApplicationRecord
  has_attachments :photos, maximum: 3
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :bookings, through: :events
  has_many :reviews, through: :bookings


  # validates :title, presence: true
  # validates :description, presence: true
  # validates :address, presence: true
  # validates :category, presence: true

  monetize :price_cents

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


end
