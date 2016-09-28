class ChangeCostOfferStringToInteger < ActiveRecord::Migration
  def change
    change_column :opportunities, :cost_or_offer_option, 'integer USING CAST(cost_or_offer_option AS integer)'
  end
end
