class AddSecondaryEducationToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :second_university_id, :integer
    add_column :students, :second_major_id, :integer
    add_column :students, :second_ed_level_id, :integer
  end
end
