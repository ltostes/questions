class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :registrations
  has_many :subscriptions
=======
  validates :name, :surname, presence: true
  has_many :subscriptions, :registrations
>>>>>>> 673841bb17da53fa5b8e58bf1b4320db0595cdbe
end
