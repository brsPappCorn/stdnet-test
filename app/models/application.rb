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
#  selected                :boolean          default(FALSE)
#  rating                  :integer          default(0)
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
  validates_presence_of :student_characteristics, :student_interests
  validates :portfolio, file_size: { less_than: 3.megabytes }
  validates :portfolio, presence: true, if: 'self.applied_opportunity.receive_portfolio'
  validate :validate_student_answer, :validate_opportunity_value

  #---------------------
  # Uploaders
  #---------------------
  mount_uploader :portfolio, PortfolioUploader

  #---------------------
  # Methods
  #---------------------
  def validate_student_answer
    if !self.applied_opportunity.question_for_student.to_s.blank? && self.student_answer.blank?
      self.errors.add :student_answer, :blank
    end
  end

  def validate_opportunity_value
    if self.applied_opportunity.cost_or_offer_option == Opportunity::OPTION_FOR_OFFER && self.opportunity_value.blank?
      self.errors.add :opportunity_value, :blank
    end
  end

  def mark_as_selected
    self.selected = true
    self.save
  end

  def rate(rating)
    self.rating = rating
    self.save
  end

end
