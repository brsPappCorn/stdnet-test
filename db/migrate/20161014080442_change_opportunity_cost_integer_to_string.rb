class ChangeOpportunityCostIntegerToString < ActiveRecord::Migration[5.1]
  def change
    change_column :opportunities, :opportunity_cost, :string
  end
end
