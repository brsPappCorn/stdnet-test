class AddTypeOfStudentToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :type_of_student, :integer
  end
end
