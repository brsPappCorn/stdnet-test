class Student < ActiveRecord::Base
  #---------------------
  # Constants
  #---------------------
  LAST_SEMESTER = %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14]

  LANGUAGE_LEVEL = [
      'Nativo', 'Avanzado', 'Intermedio', 'Básico' # Language levels
  ]

  OPTION_FOR_NO = 0
  OPTION_FOR_YES = 1

  #---------------------
  # Associations
  #---------------------
  belongs_to :user
  belongs_to :university
  belongs_to :major
  belongs_to :country
  belongs_to :language
  belongs_to :education_level, foreign_key: 'ed_level_id'

  has_and_belongs_to_many :tools

  #---------------------
  # Uploaders
  #---------------------
  mount_uploader :avatar, AvatarUploader

  #---------------------
  # Validations
  #---------------------
  # TODO: Student.rb - Declare validations
  # validates_presence_of :major_id
  # validates_presence_of :university_id

end