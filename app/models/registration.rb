class Registration < ActiveRecord::Base
  validates :status, presence: true
  belongs_to :user, :classroom
end
