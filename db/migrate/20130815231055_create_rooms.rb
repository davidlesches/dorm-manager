class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :rooms, :user_id
  end
end
