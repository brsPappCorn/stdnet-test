class AddSelectedToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :selected, :boolean, default: false
    add_column :applications, :rating, :integer, default: false
  end
end
