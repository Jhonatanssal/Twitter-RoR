class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: :follower_id, class_name: 'User'
  belongs_to :followed_user, foreign_key: :followed_id, class_name: 'User'
  validates :followed_id, uniqueness: { scope: :follower }
  validates :follower, :followed_id, presence: true
end
