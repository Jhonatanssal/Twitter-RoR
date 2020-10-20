class AddUserIdToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :user_id, :integer
    add_index :tweets, :user_id
  end
end
