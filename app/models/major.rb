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
  has_many :opportunities, dependent: :destroy
  has_and_belongs_to_many :students
  has_and_belongs_to_many :opportunities

  alias_attribute :name, :major_name

end
