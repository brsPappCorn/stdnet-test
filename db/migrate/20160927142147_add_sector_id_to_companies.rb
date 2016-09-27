class AddSectorIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_sector_id, :integer
  end
end
