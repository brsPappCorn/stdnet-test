class AddDescriptionInfoToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :strengths, :text
    add_column :students, :areas_to_develop, :text
    add_column :students, :hobbies, :text
  end
end
