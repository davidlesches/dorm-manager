class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :report
      t.references :student
      t.string :status

      t.timestamps
    end
    add_index :attendances, :report_id
    add_index :attendances, :student_id
  end
end
