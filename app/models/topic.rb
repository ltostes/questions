class Topic < ActiveRecord::Base
  validates :name, presence: true
  has_many :questions

  belongs_to :parent_topic, :class_name => "Topic", :foreign_key => "parent_topic_id"
  has_many :child_topics, :class_name => "Topic", :foreign_key => "parent_topic_id"
end
