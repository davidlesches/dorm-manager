class AddExemptionsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :exemptions, :integer, default: 0
  end
end
