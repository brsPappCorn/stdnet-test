class CreateNotificationPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :notification_posts do |t|
      t.string :name
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
