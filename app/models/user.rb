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

  REFERENCED_BY = [
      'Un amigo', 'Universidad', 'Facebook' # TODO: User Model - Update information once the client delivers the list.
  ]
  # List of References. If you are going to include a new reference, please add it also to the comment below, to keep track of references.

  PROMO_CODE = [
      # TODO: User Model - Promotional codes will be defined later on.
  ]
  # List of References. If you are going to include a new promotional code, please add it also to the comment below, to keep track of promotional codes.

  #---------------------
  # Associations
  #---------------------
  has_one :company, dependent: :destroy
  has_one :student, dependent: :destroy
  has_one :person, dependent: :destroy
  #belongs_to :administrator

  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :person

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations


end
