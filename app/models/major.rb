class Major < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :students, dependent: :destroy
  has_many :opportunities, dependent: :destroy

  accepts_nested_attributes_for :students
  accepts_nested_attributes_for :opportunities

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end
