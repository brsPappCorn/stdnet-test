class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :university_id
      t.integer :major_id
      t.integer :promo_id
      t.integer :role_id

      t.timestamps null: false
    end
  end
end
