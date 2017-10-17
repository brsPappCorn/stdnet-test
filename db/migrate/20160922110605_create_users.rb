class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :role_id
      t.integer :student_id
      t.integer :company_id
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
