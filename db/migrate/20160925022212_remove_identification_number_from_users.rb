class RemoveIdentificationNumberFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :identification_document, :integer
  end
end
