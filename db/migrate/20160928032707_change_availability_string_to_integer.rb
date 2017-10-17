class ChangeAvailabilityStringToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :opportunities, :availability, 'integer USING CAST(availability AS integer)'
  end
end
