class ChangePromoIdType < ActiveRecord::Migration
  def change
    change_column :users, :promo_id, :string
  end
end
