class RemoveRoleIdFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :role_id, :integer
  end
end
