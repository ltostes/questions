class Classroom < ActiveRecord::Base
  validates :name, presence: true
  has_many :registrations, :events, :topics, :notifications
end
