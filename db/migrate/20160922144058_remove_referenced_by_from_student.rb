class RemoveReferencedByFromStudent < ActiveRecord::Migration
  def change
    remove_column :students, :referenced_by, :string
  end
end
