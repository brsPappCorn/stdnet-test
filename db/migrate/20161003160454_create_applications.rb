class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :student_characteristics
      t.string :student_interests
      t.string :student_answer
      t.string :opportunity_value
      t.integer :user_id
      t.integer :opportunity_id

      t.timestamps null: false

      t.index [:opportunity_id, :user_id]
    end

    drop_join_table :opportunities, :users

  end
end
