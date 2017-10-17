class AddWorkExperienceInfoToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :work_xp, :boolean
    add_column :students, :xp_company, :string
    add_column :students, :xp_position, :text
    add_column :students, :xp_achievements, :text
    add_column :students, :volunteer_xp, :boolean
    add_column :students, :volunteer_org, :string
    add_column :students, :volunteer_functions, :text
  end
end
