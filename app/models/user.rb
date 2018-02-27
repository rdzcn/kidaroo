class User < ApplicationRecord
  has_many :activities
  has_many :bookings
  has_many :events, through: :bookings
  has_many :reviews, through: :bookings
  # has_many :somethings, through: :events, foreign_key: "activity_id", class_name: "Activity"
  has_many :plans, :through => :events, :source => :activity
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
