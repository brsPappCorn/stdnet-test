class AddOtherCityToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :other_city, :string
  end
end
