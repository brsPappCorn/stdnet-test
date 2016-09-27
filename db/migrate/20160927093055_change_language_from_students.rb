class ChangeLanguageFromStudents < ActiveRecord::Migration
  def change
    rename_column :students, :language, :language_id
  end
end
