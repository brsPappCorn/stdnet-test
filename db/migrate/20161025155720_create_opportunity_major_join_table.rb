class CreateOpportunityMajorJoinTable < ActiveRecord::Migration
  def change
    create_join_table :majors, :opportunities
  end
end
