class Student < ActiveRecord::Base
  #---------------------
  # Constants
  #---------------------


  #---------------------
  # Associations
  #---------------------
  belongs_to :user


  #---------------------
  # Validations
  #---------------------
  # validates_presence_of :major_id
  # validates_presence_of :major_id

end
