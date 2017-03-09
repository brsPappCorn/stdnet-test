# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  role_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  promo_id               :string
#  referenced_by          :string
#  first_name             :string
#  last_name              :string
#  date_of_birth          :date
#  document_number        :string
#  mobile_phone           :string
#  city_id                :integer
#  country_id             :integer
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  other_city             :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #---------------------
  # Constants
  #---------------------

  ROLE_STUDENT = 2
  ROLE_COMPANY = 3
  ROLE_PERSON = 4

  REFERENCES_USER = [
      'Anuncios / publicidad en Facebook',
      'Publicaciones en grupos de Facebook',
      'Linked In',
      'Instagram',
      'Un/a amigo/a',
      'Evento o conferencia',
      'Google u otro motor de búsqueda',
      'Correo electróncio'
  ]

  REF_FACEBOOK_AD = 0
  REF_FACEBOOK_GROUPS = 1
  REF_LINKED_IN = 2
  REF_INSTAGRAM = 3
  REF_FRIEND = 4
  REF_EVENT = 5
  REF_SEM = 6
  REF_EMAIL = 7
  REF_STUDENT_UNIVERSITY = 8


  #---------------------
  # Associations
  #---------------------
  has_one :company, dependent: :destroy
  has_one :student, dependent: :destroy
  has_one :person, dependent: :destroy

  has_many :opportunities # Company/People association for creation of an opportunity
  has_many :applications
  has_many :applied_opportunities, through: :applications, class_name: 'Opportunity'

  belongs_to :city
  belongs_to :country

  # Admin
  #belongs_to :administrator

  accepts_nested_attributes_for :company, update_only: true
  accepts_nested_attributes_for :student, update_only: true
  accepts_nested_attributes_for :person, update_only: true

  #---------------------
  # Validations
  #---------------------
  validates_presence_of :student, if: Proc.new { |u| u.role_id == ROLE_STUDENT }
  validates_presence_of :company, if: Proc.new { |u| u.role_id == ROLE_COMPANY }
  validates_presence_of :person, if: Proc.new { |u| u.role_id == ROLE_PERSON }

  #---------------------
  # Methods
  #---------------------
  def has_role?(role)
    self.role_id == role
  end

  def role_name
    case self.role_id
      when ROLE_STUDENT
        'Estudiante'
      when ROLE_COMPANY
        'Empresa'
      when ROLE_PERSON
        'Persona'
      else
        'N/D'
    end
  end

  def can_create_opportunity?
    self.role_id != 2
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def profile_incomplete?
    if basic_profile_incomplete?
      true
    else
      if self.role_id == User::ROLE_STUDENT
        self.student.profile_incomplete?
      elsif self.role_id == User::ROLE_COMPANY
        self.company.profile_incomplete?
      elsif self.role_id == User::ROLE_PERSON
        self.person.profile_incomplete?
      end
    end
  end

  def definitive_location
    city = ''

    if self.country.nil?
      'N/D'
    else
      if self.country.country_name.eql? 'Colombia'
        if self.city
          if self.city.city_name.eql? 'Otra'
            city = "#{self.other_city}, "
          else
            city = "#{self.city.city_name},  "
          end
        else
          city = ''
        end
      end

      city << self.country.country_name
    end
  end

  def friendly_age
    now = Time.now.utc.to_date

    if self.date_of_birth
      "#{now.year - self.date_of_birth.year - (self.date_of_birth.month > now.month || (self.date_of_birth.month == now.month && self.date_of_birth.day > now.day) ? 1 : 0)} años"
    else
      'N/D'
    end
  end

  def application_for_opportunity(opportunity_id)
    self.applications.where(opportunity_id: opportunity_id).first
  end

  def average_rating
    rated_applications = self.applications.where('selected = ? AND rating != ?', true, 0)

    if rated_applications.count > 0
      average = rated_applications.inject(0) { |memo, object| memo + object.rating }.to_f / rated_applications.count
      average.round 1
    else
      -1
    end
  end

  def studnet_experience_projects
    self.applications.where('selected = ? AND rating != ?', true, 0)
  end

  def self.filter_by_email(email)
    where('email ILIKE ?', "%#{email}%")
  end

  def self.all_by_role(role_id)
    where role_id: role_id
  end

  #---------------------
  # Private methods
  #---------------------
  private
  def basic_profile_incomplete?
    basic_common_info = self.first_name.blank? || self.last_name.blank? || self.mobile_phone.blank? || self.country_id.nil? || (self.city_id.nil? && (!self.country_id.nil? && self.country.country_name.eql?('Colombia')))

    if self.role_id == User::ROLE_STUDENT
      basic_common_info = basic_common_info || self.document_number.blank? || self.date_of_birth.nil?
    elsif self.role_id == User::ROLE_COMPANY
      # Nothing for now
    elsif self.role_id == User::ROLE_PERSON
      # Nothing for now
    end

    basic_common_info
  end

end
