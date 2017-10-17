class RemoveExchangeCountryIdFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :exchange_country_id, :integer
  end
end
