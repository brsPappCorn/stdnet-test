class AddMoreOtherExperienceToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :second_volunteer_org, :string
    add_column :students, :second_volunteer_functions, :text

    add_column :students, :third_volunteer_org, :string
    add_column :students, :third_volunteer_functions, :text
  end
end
