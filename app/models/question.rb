class Question < ActiveRecord::Base
  belongs_to :topic
  has_many :answers
  has_many :subscriptions

  def self.open
    0
  end

  def self.owner_approved
    1
  end

  def self.instructor_approved
    2
  end

  def self.both_approved
    3
  end

  def self.instructor_flagged
    4
  end
end
