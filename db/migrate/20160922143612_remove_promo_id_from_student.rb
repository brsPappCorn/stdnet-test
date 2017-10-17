class RemovePromoIdFromStudent < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :promo_id, :integer
  end
end
