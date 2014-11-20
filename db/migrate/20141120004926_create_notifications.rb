class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :description
      t.datetime :send_time

      t.timestamps
    end
  end
end
