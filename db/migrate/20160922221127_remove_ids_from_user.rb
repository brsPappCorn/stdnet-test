class RemoveIdsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :student_id, :integer
    remove_column :users, :company_id, :integer
    remove_column :users, :person_id, :integer
  end
end
