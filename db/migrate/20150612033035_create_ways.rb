class CreateWays < ActiveRecord::Migration
  def change
    create_table :ways do |t|
      t.time :limit_time
      t.string :origin

      t.timestamps null: false
    end
  end
end
