class RemoveRoleIdFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :role_id, :integer
  end
end
