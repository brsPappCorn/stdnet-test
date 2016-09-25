class Country < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :users

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end