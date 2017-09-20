class AddFieldsToOpportunity < ActiveRecord::Migration[5.1]
  def change
    add_column :opportunities, :description, :string
    add_column :opportunities, :schedule, :string
    add_column :opportunities, :contract_type, :integer
    add_column :opportunities, :city_id, :integer
    add_column :opportunities, :salary, :text
    add_column :opportunities, :compensatory_time_off, :integer
  end
end

#ss