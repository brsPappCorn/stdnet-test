class AddOtherToolsAndSkillsToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :other_tools_skills, :string
  end
end
