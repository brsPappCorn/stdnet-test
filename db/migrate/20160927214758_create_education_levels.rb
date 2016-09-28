class CreateEducationLevels < ActiveRecord::Migration
  def change
    create_table :education_levels do |t|
      t.string :level_name

      t.timestamps null: false
    end
  end
end
