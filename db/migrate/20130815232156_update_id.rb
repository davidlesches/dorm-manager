class UpdateId < ActiveRecord::Migration
  def change
    rename_column :rooms, :user_id, :counselor_id
  end
end
