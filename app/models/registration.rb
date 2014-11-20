class Registration < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
  belongs_to :classroom
=======
  validates :status, presence: true
  belongs_to :user, :classroom
>>>>>>> 673841bb17da53fa5b8e58bf1b4320db0595cdbe
end
