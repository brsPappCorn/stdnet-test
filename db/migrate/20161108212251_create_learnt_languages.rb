class CreateLearntLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :learnt_languages do |t|
      t.integer :language_id
      t.integer :student_id
      t.string :language_level
    end
  end
end
