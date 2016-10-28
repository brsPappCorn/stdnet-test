class AddTypeOfStudentToStudents < ActiveRecord::Migration
  def change
    add_column :students, :type_of_student, :integer
  end
end
