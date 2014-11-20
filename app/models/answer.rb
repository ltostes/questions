class Answer < ActiveRecord::Base
<<<<<<< HEAD
=======
  validates :description, :rank, :status, presence: true

>>>>>>> 673841bb17da53fa5b8e58bf1b4320db0595cdbe
  belongs_to :question
end
