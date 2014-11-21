class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  def find_author
    return self.where(status: Subscription.author).user
  end
  
  def self.unfollow
    0
  end

  def self.author
    1
  end

  def self.follower
    2
  end
end
