class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :classroom
  validates :status, presence: true
end
