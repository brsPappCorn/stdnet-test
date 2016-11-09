class AddMoreWorkExperienceStudent < ActiveRecord::Migration
  def change
    add_column :students, :second_xp_company, :string
    add_column :students, :second_xp_position, :text
    add_column :students, :second_xp_achievements, :text

    add_column :students, :third_xp_company, :string
    add_column :students, :third_xp_position, :text
    add_column :students, :third_xp_achievements, :text
  end
end
