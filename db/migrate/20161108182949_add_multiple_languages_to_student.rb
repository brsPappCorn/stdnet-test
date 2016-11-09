class AddMultipleLanguagesToStudent < ActiveRecord::Migration
  def change
    remove_column :students, :language_id
    remove_column :students, :language_level
  end
end