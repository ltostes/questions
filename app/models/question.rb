class Question < ActiveRecord::Base
  belongs_to :topic
  has_many :answers
  has_many :subscriptions

  def self.open
    0
  end

  def self.author_approved
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

  def find_author
    return self.subscriptions.find_by(status: Subscription.author).user 
  end
end
