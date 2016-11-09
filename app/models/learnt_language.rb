# == Schema Information
#
# Table name: learnt_languages
#
#  id             :integer          not null, primary key
#  language_id    :integer
#  student_id     :integer
#  language_level :string
#

class LearntLanguage < ActiveRecord::Base

  #---------------------
  # Constants
  #---------------------
  LANGUAGE_LEVEL = [
      'Nativo', 'Avanzado', 'Intermedio', 'Básico' # Language levels
  ]

  #---------------------
  # Associations
  #---------------------
  belongs_to :language
  belongs_to :student
end
