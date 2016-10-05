class Administrator < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #---------------------
  # Associations
  #---------------------
  # has_many :users, dependent: :destroy No validation needed. Will be an independent devise model


  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations


end
