class AddOtherCityToUser < ActiveRecord::Migration
  def change
    add_column :users, :other_city, :string
  end
end
