 # == Schema Information
#
# Table name: transactions
#
#  id                      :integer          not null, primary key
#  transaction_state       :string
#  plan                    :string
#  reference_number        :string
#  pol_transaction_state   :string
#  pol_response_code       :string
#  description             :string
#  lap_response_code       :string
#  lap_transaction_state   :string
#  reference_code          :string
#  reference_pol           :string
#  transaction_id          :string
#  lap_payment_method      :string
#  lap_payment_method_type :string
#  pse_bank                :string
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  amount                  :string
#

class Transaction < ApplicationRecord
	belongs_to :user
end
