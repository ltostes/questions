class Topic < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :parent_topic, :class_name => "Topic", :foreign_key => "parent_topic_id"
  belongs_to :classroom

  has_many :child_topics, :class_name => "Topic", :foreign_key => "parent_topic_id"
  has_many :questions
=======
  validates :name, presence: true
  has_many :questions

  belongs_to :parent_topic, :class_name => "Topic", :foreign_key => "parent_topic_id"
  has_many :child_topics, :class_name => "Topic", :foreign_key => "parent_topic_id"
>>>>>>> 673841bb17da53fa5b8e58bf1b4320db0595cdbe
end
