class Sector < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :companies, dependent: :destroy

  accepts_nested_attributes_for :companies

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end
