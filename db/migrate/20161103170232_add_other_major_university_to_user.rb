class AddOtherMajorUniversityToUser < ActiveRecord::Migration
  def change
    add_column :students, :other_major, :string
    add_column :students, :other_university, :string
  end
end
