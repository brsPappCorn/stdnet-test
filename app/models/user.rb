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
#  promo_id               :integer
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

  ROLE_ID = [1, 2, 3, 4]
  ROLE_NAME = ['Admin', 'Estudiante', 'Empresa', 'Persona']
  # List of Roles. If you are going to include a new role, please add it also to the comment below, to keep track of role_id
  # with its equivalent name.
  # 1 = Administrator
  # 2 = Student
  # 3 = Company
  # 4 = Person

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

  PROMO_CODE = [
      # TODO: User Model - Promotional codes will be defined later on.
  ]


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
  # TODO: Declare validations

  #---------------------
  # Methods
  #---------------------
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
      if self.role_id == 2
        self.student.profile_incomplete?
      elsif self.role_id == 3
        self.company.profile_incomplete?
      elsif self.role_id == 4
        self.person.profile_incomplete?
      end
    end
  end

  #---------------------
  # Private methods
  #---------------------
  private
  def basic_profile_incomplete?
    basic_common_info = self.first_name.blank? || self.last_name.blank? || self.mobile_phone.blank? || self.city_id.nil? || self.country_id.nil?

    if self.role_id == 2
      basic_common_info = basic_common_info || self.document_number.blank? || self.date_of_birth.nil?
    elsif self.role_id == 3
      # Nothing for now
    elsif self.role_id == 4
      # Nothing for now
    end

    basic_common_info
  end

end
