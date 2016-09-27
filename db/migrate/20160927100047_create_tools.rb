class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :tool_name

      t.timestamps null: false
    end
  end
end
