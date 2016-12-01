# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  occupation :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  profession :string
#

class Person < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  belongs_to :user

  #---------------------
  # Methods
  #---------------------
  def profile_incomplete?
    self.occupation.blank? || self.profession.blank?
  end

end
