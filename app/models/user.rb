class User < ActiveRecord::Base
  validates :name, :surname, presence: true
  has_many :subscriptions, :registrations
end
