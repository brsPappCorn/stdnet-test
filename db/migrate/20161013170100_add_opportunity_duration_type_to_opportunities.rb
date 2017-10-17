class AddOpportunityDurationTypeToOpportunities < ActiveRecord::Migration[5.1]
  def change
    add_column :opportunities, :opportunity_duration_type, :integer, default: Opportunity::OPTION_FOR_DURATION_UNDEFINED
  end
end
