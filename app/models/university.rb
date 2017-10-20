 # == Schema Information
#
# Table name: universities
#
#  id              :integer          not null, primary key
#  university_name :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class University < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :students, dependent: :destroy

  accepts_nested_attributes_for :students

  alias_attribute :name, :university_name

end
