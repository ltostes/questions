class Subscription < ActiveRecord::Base
  validates :status, presence: true
  belongs_to :user, :question
end
