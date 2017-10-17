class ChangeNameFromCompanies < ActiveRecord::Migration[5.1]
  def change
    rename_column :companies, :name, :company_name
  end
end
