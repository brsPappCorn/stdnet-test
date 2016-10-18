# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  city_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :users, dependent: :destroy

  accepts_nested_attributes_for :users

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end
