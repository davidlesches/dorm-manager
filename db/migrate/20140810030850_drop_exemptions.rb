class DropExemptions < ActiveRecord::Migration
  def change
    remove_column :students, :exemptions
  end
end
