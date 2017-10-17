class AddPromoIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :promo_id, :integer
  end
end
