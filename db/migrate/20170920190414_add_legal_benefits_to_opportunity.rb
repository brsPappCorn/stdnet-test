class AddLegalBenefitsToOpportunity < ActiveRecord::Migration[5.1]
  def change
  	add_column :opportunities, :legal_benefits, :text

  end
end
