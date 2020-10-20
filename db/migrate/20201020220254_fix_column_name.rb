class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :user_id, :author_id
    rename_column :follows, :followed_user_id, :followed_id
  end
end
