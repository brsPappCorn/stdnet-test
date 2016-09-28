class Company < ActiveRecord::Base

  #---------------------
  # Constants
  #---------------------
  COMPANY_SIZE = [
      'Menos de 10 trabajadores',
      'Entre 11 y 50 trabajadores',
      'Entre 51 y 200 trabajadores',
      'Más de 200 trabajadores'
  ]



  #---------------------
  # Associations
  #---------------------
  belongs_to :user
  belongs_to :sector, foreign_key: 'company_sector_id'


  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations


end
