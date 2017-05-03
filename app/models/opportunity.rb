# == Schema Information
#
# Table name: opportunities
#
#  id                        :integer          not null, primary key
#  opportunity_type          :integer
#  opportunity_title         :string
#  activity_description      :text
#  skills_description        :text
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
#  closed                    :boolean          default(FALSE)
#

class Opportunity < ActiveRecord::Base

  #---------------------
  # Constants
  #---------------------
  TYPE_VIRTUAL = 0
  TYPE_ON_SITE = 1
  TYPE_PRACTICE = 2
  TYPE_FIRST_JOB = 3
  TYPE_SEASONAL = 4

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

  has_many :students
  has_many :applications
  has_many :applied_users, through: :applications, class_name: 'User' # Students that applied to a company offer
  has_and_belongs_to_many :majors

  accepts_nested_attributes_for :majors

  #---------------------
  # Validations
  #---------------------
  validates_presence_of :opportunity_type, :opportunity_title, :activity_description, :skills_description,
                        :availability, :number_of_students, :user_id, :date_ini_type, :opportunity_duration_type

  #---------------------
  # Methods
  #---------------------
  def self.opportunities_for_student(student)
    major_ids = [student.major_id, student.second_major_id] + student.majors.map { |m| m.id }

    matching_opportunities = joins('INNER JOIN majors_opportunities ON majors_opportunities.opportunity_id = opportunities.id').
        where('(majors_opportunities.major_id IN (?) OR other_majors = ?) AND approved_state = ? AND closed = ?', major_ids, true, true, false)

    for_all_opportunities = where(other_majors: true, approved_state: true, closed: false)

    (matching_opportunities + for_all_opportunities).uniq
  end

  def self.approved
    where approved_state: true, closed: false
  end

  def self.pending_approval
    where approved_state: false
  end

  def approve
    self.approved_state = true
    self.save
  end

  def close
    self.closed = true
    self.save
  end

  def student_has_applied?(student)
    self.applied_users.include? student
  end

  def opportunity_type_description
    if self.opportunity_type == Opportunity::TYPE_VIRTUAL
      'Proyecto virtual'
    elsif self.opportunity_type == Opportunity::TYPE_ON_SITE
      'Empleo temporal'
    elsif self.opportunity_type == Opportunity::TYPE_PRACTICE
      'Práctica'
    elsif self.opportunity_type == Opportunity::TYPE_FIRST_JOB
      'Empleo'
    elsif self.opportunity_type == Opportunity::TYPE_SEASONAL
      'Trabajos express'
    end
  end

  def cost_or_offer_description
    if self.cost_or_offer_option == 0
      'Quiero poner un valor para el proyecto'
    else
      'Quiero escuchar ofertas de los estudiantes'
    end
  end

  def availability_description
    if self.availability == 0
      'Tiempo completo'
    elsif self.availability == 1
      'Medio tiempo'
    elsif self.availability == 2
      'Menos de 20 horas por semana'
    end
  end

  def duration_type_description
    if self.opportunity_duration_type == 0
      'Indefinida'
    else
      'Fijar duración'
    end
  end

  def selected_students
    self.applications.where selected: true
  end

  def date_ini_type_friendly
    if self.date_ini_type == Opportunity::Opportunity::TYPE_UNDEFINED
      'Indefinida'
    elsif self.date_ini_type == Opportunity::Opportunity::TYPE_AS_SOON_AS_POSSIBLE
      'Lo antes posible'
    elsif self.date_ini_type == Opportunity::Opportunity::TYPE_SET_DATE_INI
      'Fijar fecha'
    end
  end

  def get_application_for_user(user_id)
    applications_for_user = self.applications.where user_id: user_id

    if applications_for_user.count > 0
      applications_for_user.first
    else
      self.applications.build user_id: user_id
    end
  end

end
