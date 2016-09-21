class RemoveNameFromAdministrators < ActiveRecord::Migration
  def change
    remove_column :administrators, :name, :string
  end
end
