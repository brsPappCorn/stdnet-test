class AddClosedColumnToOpportunities < ActiveRecord::Migration[5.1]
  def change
    add_column :opportunities, :closed, :boolean, default: false
  end
end
