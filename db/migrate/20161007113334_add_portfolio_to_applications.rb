class AddPortfolioToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :portfolio, :string
  end
end
