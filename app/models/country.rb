class Country < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :users, dependent: :destroy

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end