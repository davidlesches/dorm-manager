class RenameTable < ActiveRecord::Migration
  def change
    rename_table :users, :counselors
  end
end
