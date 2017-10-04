class FixColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :transactions, :lap_payment_methid_type, :lap_payment_method_type
  end
end
