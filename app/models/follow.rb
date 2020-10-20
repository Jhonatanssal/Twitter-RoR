class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: :follower_id, class_name: 'User'
  belongs_to :followed_user, foreign_key: :followed_user_id, class_name: 'User'
  validates :followed_user_id, uniqueness: { scope: :follower }
  validates :follower, :followed_user_id, presence: :true
end
