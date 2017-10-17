class AddGpaMaxToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :gpa_max, :string
  end
end
