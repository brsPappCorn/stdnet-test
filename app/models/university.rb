class University < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :students

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end
