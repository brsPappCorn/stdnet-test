class ChangeOpportunityCostIntegerToString < ActiveRecord::Migration
  def change
    change_column :opportunities, :opportunity_cost, :string
  end
end
