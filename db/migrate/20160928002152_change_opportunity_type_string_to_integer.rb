class ChangeOpportunityTypeStringToInteger < ActiveRecord::Migration
  def change
    change_column :opportunities, :opportunity_type, 'integer USING CAST(opportunity_type AS integer)'
  end
end
