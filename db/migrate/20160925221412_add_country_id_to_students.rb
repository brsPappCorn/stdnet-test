class AddCountryIdToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :country_id, :integer
  end
end
