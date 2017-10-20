 # == Schema Information
#
# Table name: tools
#
#  id         :integer          not null, primary key
#  tool_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tool < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_and_belongs_to_many :students

  alias_attribute :name, :tool_name

end
