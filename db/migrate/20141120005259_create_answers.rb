class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :description
      t.integer :rank
      t.integer :status

      t.timestamps
    end
  end
end
