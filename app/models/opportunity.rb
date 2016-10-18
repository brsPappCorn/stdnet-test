# == Schema Information
#
# Table name: opportunities
#
#  id                        :integer          not null, primary key
#  opportunity_type          :integer
#  opportunity_title         :string
#  activity_description      :text
#  skills_description        :text
#  major_id                  :integer
#  other_majors              :boolean
#  question_for_student      :string
#  date_ini                  :date
#  opportunity_duration      :string
#  availability              :integer
#  cost_or_offer_option      :integer
#  opportunity_cost          :string
#  receive_portfolio         :boolean
#  number_of_students        :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  user_id                   :integer
#  approved_state            :boolean          default(FALSE)
#  date_ini_type             :integer          default(0)
#  opportunity_duration_type :integer          default(0)
#

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

  TYPE_UNDEFINED = 0
  TYPE_AS_SOON_AS_POSSIBLE = 1
  TYPE_SET_DATE_INI = 2

  OPTION_FOR_DURATION_UNDEFINED = 0
  OPTION_FOR_DURATION_DEFINED = 1

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
  # Methods
  #---------------------
  def self.opportunities_for_student(student)
    where major_id: student.major_id, approved_state: true
  end

  def self.approved
    where approved_state: true
  end

  def self.pending_approval
    where approved_state: false
  end

  def approve
    self.approved_state = true
    self.save
  end

end
