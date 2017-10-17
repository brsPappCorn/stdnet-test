class ChangeNameFromMajors < ActiveRecord::Migration[5.1]
  def change
    rename_column :majors, :name, :major_name
  end
end
