# == Schema Information
#
# Table name: companies
#
#  id                  :integer          not null, primary key
#  company_name        :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  position            :string
#  company_address     :string
#  company_nit         :string
#  company_description :text
#  company_size        :string
#  company_website_url :string
#  company_sector_id   :integer
#

class Company < ActiveRecord::Base

  #---------------------
  # Constants
  #---------------------
  COMPANY_SIZE = [
      'Menos de 10 trabajadores',
      'Entre 11 y 50 trabajadores',
      'Entre 51 y 200 trabajadores',
      'Más de 200 trabajadores'
  ]

  #---------------------
  # Associations
  #---------------------
  belongs_to :user
  belongs_to :sector, foreign_key: 'company_sector_id'


  #---------------------
  # Validations
  #---------------------
  # TODO: Declare validations

  #---------------------
  # Methods
  #---------------------
  def profile_incomplete?
    self.company_name.blank? || self.position.blank? || self.company_address.blank? || self.company_nit.blank? || \
self.company_description.blank? || self.company_size.blank? || self.company_website_url.blank? || \
self.company_sector_id.nil?
  end

end
