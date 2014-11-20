class Classroom < ActiveRecord::Base
  has_many :registrations
  has_many :topics
  has_many :events
  has_many :notifications
end
