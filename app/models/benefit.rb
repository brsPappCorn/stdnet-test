 # == Schema Information
#
# Table name: benefits
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Benefit < ApplicationRecord
 has_and_belongs_to_many :opportunities


 accepts_nested_attributes_for :opportunities
end
