class Answer < ActiveRecord::Base
  validates :description, :rank, :status, presence: true

  belongs_to :question
end
