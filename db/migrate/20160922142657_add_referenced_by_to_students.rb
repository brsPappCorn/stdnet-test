class AddReferencedByToStudents < ActiveRecord::Migration
  def change
    add_column :students, :referenced_by, :string
  end
end
