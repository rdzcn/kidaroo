class Activity < ApplicationRecord
  has_attachments :photos, maximum: 3
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :bookings, through: :events
  has_many :reviews, through: :bookings

  validates :title, presence: true
  validates :district, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :category, presence: true

  scope :with_events, -> { joins(:events) }
  scope :starting_from_today, -> do
    where("events.start_date >= ?", Date.today)
  end
  scope :with_category, -> (category) do
    where("category ILIKE ?", "%#{category}%") unless category.blank?
  end
  scope :with_age_group, -> (age_group) do
    where(age_group: age_group) unless age_group.blank?
  end
  scope :with_city, -> (city) do
    where("district ILIKE ?", city) unless city.blank?
  end
  scope :with_latitude_and_longitude, -> (address) do
    where.not(latitude: nil, longitude: nil) unless address.blank?
  end

  monetize :price_cents

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    rating_list = self.reviews.map do |review|
      review.activity_rating
      end
    rating_list.compact.count == 0 ? 0 : rating_list.compact.sum / rating_list.compact.count
  end

end
