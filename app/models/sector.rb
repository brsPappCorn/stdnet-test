# == Schema Information
#
# Table name: sectors
#
#  id          :integer          not null, primary key
#  sector_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sector < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :companies, dependent: :destroy

  accepts_nested_attributes_for :companies

  alias_attribute :name, :sector_name

end
