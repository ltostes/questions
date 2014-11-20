class Notification < ActiveRecord::Base
<<<<<<< HEAD
=======
  validates :name, :send_time, presence: true
>>>>>>> 673841bb17da53fa5b8e58bf1b4320db0595cdbe
  belongs_to :classroom
end
