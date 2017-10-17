class AddPortfolioToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :portfolio, :string
  end
end
