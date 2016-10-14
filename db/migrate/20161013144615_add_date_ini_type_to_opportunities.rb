class AddDateIniTypeToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :date_ini_type, :integer, default: Opportunity::TYPE_UNDEFINED
  end
end
