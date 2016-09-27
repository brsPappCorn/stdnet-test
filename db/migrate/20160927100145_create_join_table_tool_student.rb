class CreateJoinTableToolStudent < ActiveRecord::Migration
  def change
    create_join_table :tools, :students do |t|
      # t.index [:tool_id, :student_id]
      # t.index [:student_id, :tool_id]
    end
  end
end
