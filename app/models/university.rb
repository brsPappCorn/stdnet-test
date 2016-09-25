class University < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :students, dependent: :destroy

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end
