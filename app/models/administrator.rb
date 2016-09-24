class Administrator < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  # has_many :users, dependent: :destroy No validation needed. Will be an independent devise model


  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations


end
