class ChangeStudentsRemainingBooleansToIntegers < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :exchange_student, 'integer USING CAST(exchange_student AS integer)'
    change_column :students, :programming_skills, 'integer USING CAST(programming_skills AS integer)'
  end
end
