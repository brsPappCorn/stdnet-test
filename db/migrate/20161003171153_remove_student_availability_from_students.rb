class RemoveStudentAvailabilityFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :student_availability, :string
  end
end
