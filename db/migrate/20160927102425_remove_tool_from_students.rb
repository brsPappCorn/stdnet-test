class RemoveToolFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :tools, :string
  end
end
