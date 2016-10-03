class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

  REFERENCES_STUDENT = [
      'Anuncios / publicidad en Facebook',
      'Publicaciones en grupos de Facebook',
      'Linked In',
      'Instagram',
      'Un/a amigo/a',
      'Evento o conferencia',
      'Google u otro motor de búsqueda',
      'Correo electróncio',
      'Universidad'
  ]

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

end
