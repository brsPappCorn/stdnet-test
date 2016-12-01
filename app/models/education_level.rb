# == Schema Information
#
# Table name: education_levels
#
#  id         :integer          not null, primary key
#  level_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EducationLevel < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :students, dependent: :destroy

  accepts_nested_attributes_for :students
end
