class Student < ActiveRecord::Base
  #---------------------
  # Constants
  #---------------------
  LAST_SEMESTER = %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14]

  #---------------------
  # Associations
  #---------------------
  belongs_to :user
  belongs_to :university
  belongs_to :major
  belongs_to :country

  #---------------------
  # Validations
  #---------------------
  # TODO: Student.rb - Declare validations
  # validates_presence_of :major_id
  # validates_presence_of :university_id

end
