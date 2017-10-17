class AddCompanyInfoExtrasToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :company_nit, :string
    add_column :companies, :company_description, :text
    add_column :companies, :company_size, :string
    add_column :companies, :company_website_url, :string
  end
end
