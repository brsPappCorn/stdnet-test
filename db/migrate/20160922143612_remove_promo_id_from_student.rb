class RemovePromoIdFromStudent < ActiveRecord::Migration
  def change
    remove_column :students, :promo_id, :integer
  end
end
