class AddSecondMajorUniversity < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :second_other_major, :string
    add_column :students, :second_other_university, :string
  end
end

