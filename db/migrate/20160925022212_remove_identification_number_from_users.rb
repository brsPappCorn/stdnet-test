class RemoveIdentificationNumberFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :identification_document, :integer
  end
end
