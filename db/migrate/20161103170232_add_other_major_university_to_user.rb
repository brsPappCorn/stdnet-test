class AddOtherMajorUniversityToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :other_major, :string
    add_column :students, :other_university, :string
  end
end
