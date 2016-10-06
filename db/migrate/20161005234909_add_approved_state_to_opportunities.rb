class AddApprovedStateToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :approved_state, :boolean, default: false
  end
end
