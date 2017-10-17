class ChangeOpportunityTypeStringToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :opportunities, :opportunity_type, 'integer USING CAST(opportunity_type AS integer)'
  end
end
