class ChangePromoIdType < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :promo_id, :string
  end
end
