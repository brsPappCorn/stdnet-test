class ChangeLanguageIdStringToInteger < ActiveRecord::Migration
  def change
    change_column :students, :language_id, 'integer USING CAST(language_id AS integer)'
  end
end
