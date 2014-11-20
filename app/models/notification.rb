class Notification < ActiveRecord::Base
  validates :title, :send_time, presence: true
  belongs_to :classroom
end
