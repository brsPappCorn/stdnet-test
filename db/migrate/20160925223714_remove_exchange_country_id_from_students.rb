class RemoveExchangeCountryIdFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :exchange_country_id, :integer
  end
end
