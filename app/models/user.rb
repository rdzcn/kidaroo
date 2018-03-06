class User < ApplicationRecord
  enum role: { customer: 0, provider: 1 }
  has_attachment :avatar
  has_many :activities # provider
  has_many :messages # client and # provider
  has_many :bookings # client
  has_many :events, through: :bookings # client
  has_many :reviews, through: :bookings # client
  has_many :events, through: :messages
  # has_many :somethings, through: :events, foreign_key: "activity_id", class_name: "Activity"
  has_many :plans, :through => :events, :source => :activity  #client
  # has_many :activities, through: :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def provider_rating
    list_of_ratings = activities.map { |activity|
      act = activity.reviews
      unless act.empty?
        ac = act.map(&:provider_rating).compact
        ac.sum / ac.count unless ac.blank?
      end
    }
    if  list_of_ratings.compact.count == 0
      0
    else
      list_of_ratings.compact.sum / list_of_ratings.compact.count
    end
  end
end

