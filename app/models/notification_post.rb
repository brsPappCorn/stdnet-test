# == Schema Information
#
# Table name: notification_posts
#
#  id         :integer          not null, primary key
#  name       :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_notification_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class NotificationPost < ApplicationRecord
  belongs_to :user
end
