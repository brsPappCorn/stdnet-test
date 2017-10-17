class CreateSectors < ActiveRecord::Migration[5.1]
  def change
    create_table :sectors do |t|
      t.string :sector_name

      t.timestamps null: false
    end
  end
end
