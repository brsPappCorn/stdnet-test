# == Schema Information
#
# Table name: countries
#
#  id           :integer          not null, primary key
#  country_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Country < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :users, dependent: :destroy
  has_many :students, dependent: :destroy

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :students

end
