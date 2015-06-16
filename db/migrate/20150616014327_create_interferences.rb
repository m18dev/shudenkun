class CreateInterferences < ActiveRecord::Migration
  def change
    create_table :interferences do |t|
      t.integer :target_user

      t.timestamps null: false
    end
  end
end
