class AddOtherToolsAndSkillsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :other_tools_skills, :string
  end
end
