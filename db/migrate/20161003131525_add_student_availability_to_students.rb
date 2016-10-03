class AddStudentAvailabilityToStudents < ActiveRecord::Migration
  def change
    add_column :students, :student_availability, :integer
  end
end
