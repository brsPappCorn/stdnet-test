class Student < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  belongs_to :user
  belongs_to :university
  belongs_to :major

  #---------------------
  # Validations
  #---------------------
  # TODO: Student.rb - Declare validations
  # validates_presence_of :major_id
  # validates_presence_of :university_id

end
