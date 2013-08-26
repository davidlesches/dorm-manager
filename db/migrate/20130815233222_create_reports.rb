class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :counselor
      t.date :report_date

      t.timestamps
    end
    add_index :reports, :counselor_id
  end
end
