class AddClosedColumnToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :closed, :boolean, default: false
  end
end
