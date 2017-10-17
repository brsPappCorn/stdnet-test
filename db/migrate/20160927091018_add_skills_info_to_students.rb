class AddSkillsInfoToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :language, :string
    add_column :students, :language_level, :string
    add_column :students, :tools, :string
    add_column :students, :programming_skills, :boolean
    add_column :students, :programing_languages, :text
  end
end
