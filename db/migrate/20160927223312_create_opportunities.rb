class CreateOpportunities < ActiveRecord::Migration[5.1]
  def change
    create_table :opportunities do |t|
      t.string :opportunity_type
      t.string :opportunity_title
      t.text :activity_description
      t.text :skills_description
      t.integer :major_id
      t.boolean :other_majors
      t.string :question_for_student
      t.date :date_ini
      t.string :opportunity_duration
      t.string :availability
      t.string :cost_or_offer_option
      t.integer :opportunity_cost
      t.boolean :receive_portfolio
      t.integer :number_of_students

      t.timestamps null: false
    end
  end
end
