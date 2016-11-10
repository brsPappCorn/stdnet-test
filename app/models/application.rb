# == Schema Information
#
# Table name: applications
#
#  id                      :integer          not null, primary key
#  student_characteristics :string
#  student_interests       :string
#  student_answer          :string
#  opportunity_value       :string
#  user_id                 :integer
#  opportunity_id          :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  portfolio               :string
#
# Indexes
#
#  index_applications_on_opportunity_id_and_user_id  (opportunity_id,user_id)
#

class Application < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  belongs_to :applied_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :applied_opportunity, class_name: 'Opportunity', foreign_key: 'opportunity_id'

  #---------------------
  # Validations
  #---------------------
  validates_presence_of :student_characteristics, :student_interests, :student_answer
  validates :portfolio, file_size: { less_than: 3.megabytes }

  #---------------------
  # Uploaders
  #---------------------
  mount_uploader :portfolio, PortfolioUploader

end
