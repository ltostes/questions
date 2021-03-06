class Topic < ActiveRecord::Base
  belongs_to :parent_topic, :class_name => "Topic", :foreign_key => "parent_topic_id"
  belongs_to :classroom

  has_many :child_topics, :class_name => "Topic", :foreign_key => "parent_topic_id"
  has_many :questions

  def find_root
    if :classroom_id.nil?
      return Topic.find(parent_topic_id).find_root
    else
      return :classroom_id
    end
  end

end
