class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :beginning
      t.datetime :end
      t.belongs_to :classroom, index: true

      t.timestamps
    end
  end
end
