class Classroom < ActiveRecord::Base
<<<<<<< HEAD
  has_many :registrations
  has_many :topics
  has_many :events
  has_many :notifications
=======
  validates :name, presence: true
  has_many :registrations, :events, :topics, :notifications
>>>>>>> 673841bb17da53fa5b8e58bf1b4320db0595cdbe
end
