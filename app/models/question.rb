class Question < ActiveRecord::Base
  validates :name, :description, :rank, :status
  has_many :subscriptions, :answers
  belongs_to :topic
end
