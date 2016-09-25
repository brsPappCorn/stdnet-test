class City < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :users, dependent: :destroy

  accepts_nested_attributes_for :users

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end
