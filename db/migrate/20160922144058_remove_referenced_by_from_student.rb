class RemoveReferencedByFromStudent < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :referenced_by, :string
  end
end
