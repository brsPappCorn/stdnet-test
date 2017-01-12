# == Schema Information
#
# Table name: languages
#
#  id            :integer          not null, primary key
#  language_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Language < ActiveRecord::Base

  #---------------------
  # Associations
  #---------------------
  has_many :learnt_languages
  has_many :students, through: :learnt_languages

  alias_attribute :name, :language_name

end
