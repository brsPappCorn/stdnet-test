class ChangeNameFromMajors < ActiveRecord::Migration
  def change
    rename_column :majors, :name, :major_name
  end
end
