class AddBasicInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :document_number, :string
    add_column :users, :identification_document, :integer
    add_column :users, :mobile_phone, :string
    add_column :users, :city_id, :integer
    add_column :users, :country_id, :integer
  end
end