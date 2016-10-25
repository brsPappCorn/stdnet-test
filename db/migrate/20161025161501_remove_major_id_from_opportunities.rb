class RemoveMajorIdFromOpportunities < ActiveRecord::Migration
  def change
    remove_column :opportunities, :major_id
  end
end
