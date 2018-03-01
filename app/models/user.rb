class User < ApplicationRecord
  enum role: { customer: 0, provider: 1 }
  has_attachment :avatar
  has_many :activities
  has_many :bookings
  has_many :events, through: :bookings
  has_many :reviews, through: :bookings
  # has_many :somethings, through: :events, foreign_key: "activity_id", class_name: "Activity"
  has_many :plans, :through => :events, :source => :activity
  # has_many :activities, through: :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
