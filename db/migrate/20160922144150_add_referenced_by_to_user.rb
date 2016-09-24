class AddReferencedByToUser < ActiveRecord::Migration
  def change
    add_column :users, :referenced_by, :string
  end
end
