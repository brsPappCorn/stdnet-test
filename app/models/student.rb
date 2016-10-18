# == Schema Information
#
# Table name: students
#
#  id                   :integer          not null, primary key
#  university_id        :integer
#  major_id             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer
#  ed_level_id          :integer
#  last_semester        :string
#  gpa                  :float
#  exchange_student     :integer
#  exchange_university  :string
#  highschool           :string
#  gpa_max              :string
#  country_id           :integer
#  work_xp              :integer
#  xp_company           :string
#  xp_position          :text
#  xp_achievements      :text
#  volunteer_xp         :integer
#  volunteer_org        :string
#  volunteer_functions  :text
#  language_id          :integer
#  language_level       :string
#  programming_skills   :integer
#  programing_languages :text
#  strengths            :text
#  areas_to_develop     :text
#  hobbies              :text
#  avatar               :string
#

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

  #---------------------
  # Methods
  #---------------------
  def self.students_for_opportunity(opportunity)
    where(major_id: opportunity.major_id).includes(:user)
  end

  def profile_incomplete?
    self.university_id.nil? || self.major_id.nil? || self.ed_level_id.nil? || self.exchange_student.nil? || \
self.country_id.nil? || self.work_xp.nil? || self.volunteer_xp.nil? || self.language_id.nil? || \
self.programming_skills.nil? || self.gpa.nil? || self.last_semester.blank? || self.exchange_university.blank? || \
self.highschool.blank? || self.gpa_max.blank? || self.xp_company.blank? || self.xp_position.blank? || \
self.xp_achievements.blank? || self.volunteer_org.blank? || self.volunteer_functions.blank? || \
self.language_level.blank? || self.programing_languages.blank? || self.strengths.blank? || \
self.areas_to_develop.blank? || self.hobbies.blank? || self.avatar.blank?
  end

end
