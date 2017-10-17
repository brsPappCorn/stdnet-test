class AddReferencedByToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :referenced_by, :string
  end
end
