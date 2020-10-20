class User < ApplicationRecord
  validates :username, :fullname, presence: true, length: { maximum: 20, minimum: 3 }
  validates :username, uniqueness: true

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, foreign_key: :follower_id
  has_many :followings, through: :follows, source: :followed_user
  has_many :received_follows, foreign_key: :followed_user_id, class_name: 'Follow'
  has_many :followers, through: :received_follows, source: :follower
end
