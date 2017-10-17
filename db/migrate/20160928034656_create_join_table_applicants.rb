class CreateJoinTableApplicants < ActiveRecord::Migration[5.1]
  def change
    create_join_table :opportunities, :users do |t|
      # t.index [:opportunity_id, :student_id]
      # t.index [:student_id, :opportunity_id]
    end
  end
end
