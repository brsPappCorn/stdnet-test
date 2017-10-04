class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_state
      t.string :plan
      t.string :reference_number
      t.string :pol_transaction_state
      t.string :pol_response_code
      t.string :description
      t.string :lap_response_code
      t.string :lap_transaction_state
      t.string :reference_code
      t.string :reference_pol
      t.string :transaction_id
      t.string :lap_payment_method
      t.string :lap_payment_methid_type
      t.string :pse_bank
      t.integer :user_id

      t.timestamps
    end
  end
end
