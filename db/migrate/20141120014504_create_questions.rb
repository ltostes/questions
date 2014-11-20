class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :rank
      t.integer :status
      t.belongs_to :topic, index: true

      t.timestamps
    end
  end
end
