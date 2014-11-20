class Event < ActiveRecord::Base
<<<<<<< HEAD
=======
  validates :name, :beginning, :end, presence: true
>>>>>>> 673841bb17da53fa5b8e58bf1b4320db0595cdbe
  belongs_to :classroom
end
