class Notification < ActiveRecord::Base
  validates :name, :send_time, presence: true
  belongs_to :classroom
end
