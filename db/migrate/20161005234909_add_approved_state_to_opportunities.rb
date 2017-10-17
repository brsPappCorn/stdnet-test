class AddApprovedStateToOpportunities < ActiveRecord::Migration[5.1]
  def change
    add_column :opportunities, :approved_state, :boolean, default: false
  end
end
