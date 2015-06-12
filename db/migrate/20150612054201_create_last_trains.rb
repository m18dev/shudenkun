class CreateLastTrains < ActiveRecord::Migration
  def change
    create_table :last_trains do |t|
      t.string :depature
      t.string :destination
      t.datetime :depature_at
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
