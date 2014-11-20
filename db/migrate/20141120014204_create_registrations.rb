class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :status
      t.belongs_to :user, index: true
      t.belongs_to :classroom, index: true

      t.timestamps
    end
  end
end
