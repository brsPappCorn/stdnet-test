class EducationLevel < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :students, dependent: :destroy

  accepts_nested_attributes_for :students

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations
end
