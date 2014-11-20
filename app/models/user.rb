class User < ActiveRecord::Base
  has_many :registrations
  has_many :subscriptions
  validates :name, :surname, presence: true
end
