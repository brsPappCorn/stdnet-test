class CreateEducationLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :education_levels do |t|
      t.string :level_name

      t.timestamps null: false
    end
  end
end
