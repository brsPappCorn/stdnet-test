class ChangeLanguageFromStudents < ActiveRecord::Migration[5.1]
  def change
    rename_column :students, :language, :language_id
  end
end
