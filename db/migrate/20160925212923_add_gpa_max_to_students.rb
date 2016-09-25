class AddGpaMaxToStudents < ActiveRecord::Migration
  def change
    add_column :students, :gpa_max, :string
  end
end
