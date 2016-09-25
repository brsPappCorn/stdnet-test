class City < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :users

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end
