class CreateOpportunityMajorJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :majors, :opportunities
  end
end
