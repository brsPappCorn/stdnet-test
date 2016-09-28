class ChangeAvailabilityStringToInteger < ActiveRecord::Migration
  def change
    change_column :opportunities, :availability, 'integer USING CAST(availability AS integer)'
  end
end
