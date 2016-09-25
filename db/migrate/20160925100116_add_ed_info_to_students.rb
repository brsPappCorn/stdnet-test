class AddEdInfoToStudents < ActiveRecord::Migration
  def change
    add_column :students, :ed_level_id, :integer
    add_column :students, :last_semester, :string
    add_column :students, :gpa, :float
    add_column :students, :exchange_student, :boolean
    add_column :students, :exchange_country_id, :integer
    add_column :students, :exchange_university, :string
    add_column :students, :highschool, :string
  end
end
