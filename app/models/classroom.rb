class Classroom < ActiveRecord::Base
  has_many :registrations
  has_many :topics
  has_many :events
  has_many :notifications

  validates :name, presence: true

  def self.student
    1
  end

  def self.instructor
    2
  end

  def find_instructor
    return self.registrations.find_by(status: Classroom.instructor).user
  end
end
