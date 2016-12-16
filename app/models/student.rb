# == Schema Information
#
# Table name: students
#
#  id                         :integer          not null, primary key
#  university_id              :integer
#  major_id                   :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id                    :integer
#  ed_level_id                :integer
#  last_semester              :string
#  gpa                        :float
#  exchange_student           :integer
#  exchange_university        :string
#  highschool                 :string
#  gpa_max                    :string
#  country_id                 :integer
#  work_xp                    :integer
#  xp_company                 :string
#  xp_position                :text
#  xp_achievements            :text
#  volunteer_xp               :integer
#  volunteer_org              :string
#  volunteer_functions        :text
#  programming_skills         :integer
#  programing_languages       :text
#  strengths                  :text
#  areas_to_develop           :text
#  hobbies                    :text
#  avatar                     :string
#  type_of_student            :integer
#  other_major                :string
#  other_university           :string
#  second_university_id       :integer
#  second_major_id            :integer
#  second_ed_level_id         :integer
#  other_tools_skills         :string
#  second_xp_company          :string
#  second_xp_position         :text
#  second_xp_achievements     :text
#  third_xp_company           :string
#  third_xp_position          :text
#  third_xp_achievements      :text
#  second_volunteer_org       :string
#  second_volunteer_functions :text
#  third_volunteer_org        :string
#  third_volunteer_functions  :text
#  second_other_major         :string
#  second_other_university    :string
#

class Student < ActiveRecord::Base
  #---------------------
  # Constants
  #---------------------
  LAST_SEMESTER = %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14]

  OPTION_FOR_NO = 0
  OPTION_FOR_YES = 1

  TYPE_OF_STUDENT_DAY = 0
  TYPE_OF_STUDENT_NIGHT = 1
  TYPE_OF_STUDENT_VIRTUAL = 2
  TYPE_OF_STUDENT_DIPLOMA_PENDING = 3
  TYPE_OF_STUDENT_GRADUATE = 4

  #---------------------
  # Associations
  #---------------------
  belongs_to :user

  belongs_to :university
  belongs_to :major
  belongs_to :education_level, foreign_key: 'ed_level_id'

  belongs_to :second_university, class_name: 'University', foreign_key: 'second_university_id'
  belongs_to :second_major, class_name: 'Major', foreign_key: 'second_major_id'
  belongs_to :second_education_level, class_name: 'EducationLevel', foreign_key: 'second_ed_level_id'

  belongs_to :country

  has_and_belongs_to_many :tools
  has_and_belongs_to_many :majors

  has_many :learnt_languages
  has_many :languages, through: :learnt_languages

  accepts_nested_attributes_for :majors
  accepts_nested_attributes_for :learnt_languages

  #---------------------
  # Uploaders
  #---------------------
  mount_uploader :avatar, AvatarUploader

  #---------------------
  # Validations
  #---------------------
  validates :avatar, file_size: { less_than: 500.kilobytes }
  validates_presence_of :major, :university

  #---------------------
  # Methods
  #---------------------
  def self.students_for_opportunity(opportunity)
    major_ids = opportunity.majors.map { |m| m.id }

    joins('LEFT JOIN majors_students ON majors_students.student_id = students.id').
        where('students.major_id IN (?) OR students.second_major_id IN (?) OR majors_students.major_id IN (?) ', major_ids, major_ids, major_ids).
        includes(:user)
  end

  def definitive_major
    self.major.major_name.eql?('Otra') ? self.other_major : self.major.major_name
  end

  def definitive_university
    self.university.university_name.eql?('Otra') ? self.other_university : self.university.university_name
  end

  def has_second_major?
    !self.second_major.nil?
  end

  def definitive_second_major
    self.second_major.major_name.eql?('Otra') ? self.second_other_major : self.second_major.major_name
  end

  def definitive_second_university
    self.second_university.university_name.eql?('Otra') ? self.second_other_university : self.second_university.university_name
  end

  def profile_incomplete?
    self.university_id.nil? || self.major_id.nil? || self.ed_level_id.nil? || \
self.gpa.nil? || self.last_semester.blank? || self.highschool.blank? || self.gpa_max.blank? || \
self.strengths.blank? || self.areas_to_develop.blank? || self.hobbies.blank?
  end

  def has_second_work_xp?
    !self.second_xp_company.to_s.empty?
  end

  def has_third_work_xp?
    !self.third_xp_company.to_s.empty?
  end

  def has_second_volunteer_xp?
    !self.second_volunteer_org.to_s.empty?
  end

  def has_third_volunteer_xp?
    !self.third_volunteer_org.to_s.empty?
  end

  def delete_second_major
    self.second_university = nil
    self.second_major = nil
    self.second_education_level = nil

    self.save
  end

end
