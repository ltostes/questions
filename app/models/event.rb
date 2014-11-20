class Event < ActiveRecord::Base
  validates :name, :beginning, :end, presence: true
  belongs_to :classroom
end
