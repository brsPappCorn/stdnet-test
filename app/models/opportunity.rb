class Opportunity < ActiveRecord::Base

  #---------------------
  # Constants
  #---------------------
  TYPE_VIRTUAL = 0
  TYPE_PERSONAL = 1
  TYPE_PRACTICE = 2
  TYPE_FIRST_JOB = 3

  AVAILABILITY_FULL_TIME = 0
  AVAILABILITY_PART_TIME = 1
  AVAILABILITY_TWENTY_HOURS = 2

  OPTION_FOR_COST = 0
  OPTION_FOR_OFFER = 1

  #---------------------
  # Associations
  #---------------------
  belongs_to :user
  belongs_to :major

  has_many :students

  has_many :applications
  has_many :applied_users, through: :applications, class_name: 'User' # Students that applied to a company offer


  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

  #---------------------
  # Validations
  #---------------------
  def self.opportunities_for_student(student)
    where major_id: student.major_id
  end

end
