class AddStudentAvailabilityToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :student_availability, :integer
  end
end
