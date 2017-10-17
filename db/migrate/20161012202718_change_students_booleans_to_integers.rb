class ChangeStudentsBooleansToIntegers < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :work_xp, 'integer USING CAST(work_xp AS integer)'
    change_column :students, :volunteer_xp, 'integer USING CAST(volunteer_xp AS integer)'
  end
end
