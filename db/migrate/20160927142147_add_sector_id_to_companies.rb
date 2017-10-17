class AddSectorIdToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :company_sector_id, :integer
  end
end
