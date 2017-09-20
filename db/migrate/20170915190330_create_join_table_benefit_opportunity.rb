class CreateJoinTableBenefitOpportunity < ActiveRecord::Migration[5.1]
  def change
    create_join_table :Benefits, :Opportunities do |t|
      # t.index [:benefit_id, :opportunity_id]
      # t.index [:opportunity_id, :benefit_id]
    end
  end
end


["Auxilio de celular","bono de alimentación", "bono de dotación", "descuento en la empresa", "prima extralegal", "vacaciones extralegales"].each do |type|
  Benefit.create(name: type)
end