class CreateStudentMajorJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :majors, :students
  end
end
