class CreateStudentMajorJoinTable < ActiveRecord::Migration
  def change
    create_join_table :majors, :students
  end
end
