class CreateMajors < ActiveRecord::Migration[5.1]
  def change
    create_table :majors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
