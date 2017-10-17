class AddMultipleLanguagesToStudent < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :language_id
    remove_column :students, :language_level
  end
end