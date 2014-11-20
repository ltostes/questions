class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.belongs_to :parent_topic, :class_name => "Topic", index: true
      t.belongs_to :classroom, index: true

      t.timestamps
    end
  end
end
