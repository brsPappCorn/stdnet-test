class Country < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :users, dependent: :destroy
  has_many :students, dependent: :destroy

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :students # TODO: Review if this is necessary

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end