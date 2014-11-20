class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.text :description
      t.date :beginning
      t.date :end

      t.timestamps
    end
  end
end
