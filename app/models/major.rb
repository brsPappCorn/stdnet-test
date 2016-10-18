# == Schema Information
#
# Table name: majors
#
#  id         :integer          not null, primary key
#  major_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Major < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :students, dependent: :destroy
  has_many :opportunities, dependent: :destroy

  accepts_nested_attributes_for :students
  accepts_nested_attributes_for :opportunities

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end
