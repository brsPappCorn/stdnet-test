# == Schema Information
#
# Table name: languages
#
#  id            :integer          not null, primary key
#  language_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Language < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :students, dependent: :destroy

  accepts_nested_attributes_for :students

  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

end
