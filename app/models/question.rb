class Question < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :topic
  has_many :answers
  has_many :subscriptions
=======
  validates :name, :description, :rank, :status
  has_many :subscriptions, :answers
  belongs_to :topic
>>>>>>> 673841bb17da53fa5b8e58bf1b4320db0595cdbe
end
