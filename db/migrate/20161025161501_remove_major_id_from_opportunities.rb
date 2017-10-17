class RemoveMajorIdFromOpportunities < ActiveRecord::Migration[5.1]
  def change
    remove_column :opportunities, :major_id
  end
end
