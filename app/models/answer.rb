class Answer < ActiveRecord::Base
  validates :description, :question_id, presence: true

  belongs_to :question

  def self.normal
    0
  end

  def self.owner_approved
    1
  end

  def self.instructor_approved
    2
  end

  def self.instructor_flagged
    3
  end


end
