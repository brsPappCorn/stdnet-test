class AddCompanyInfoToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :position, :string
    add_column :companies, :company_address, :string
  end
end
