class RemoveStudentAvailabilityFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :student_availability, :string
  end
end
