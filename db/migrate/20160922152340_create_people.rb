class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :occupation

      t.timestamps null: false
    end
  end
end
