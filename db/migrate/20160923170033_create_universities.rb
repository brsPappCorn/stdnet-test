class CreateUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :university_name

      t.timestamps null: false
    end
  end
end
