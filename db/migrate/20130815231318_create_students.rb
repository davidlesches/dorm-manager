class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :room
      t.string :name

      t.timestamps
    end
    add_index :students, :room_id
  end
end
