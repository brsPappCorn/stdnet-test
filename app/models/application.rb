class Application < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  belongs_to :applied_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :applied_opportunity, class_name: 'Opportunity', foreign_key: 'opportunity_id'

  #---------------------
  # Uploaders
  #---------------------
  mount_uploader :portfolio, PortfolioUploader

end
