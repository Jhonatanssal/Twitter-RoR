class User < ApplicationRecord
  validates :username, :fullname, presence: true, length: { maximum: 20, minimum: 3 }

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, foreign_key: :follower_id

  has_many :sent_follows, foreign_key: :follower_id, class_name: 'Follow'

  has_many :followings, through: :sent_follows, source: :followed_user

  # Will return an array of follows for the given user instance
  has_many :received_follows, foreign_key: :followed_user_id, class_name: 'Follow'

  # Will return an array of users who follow the user instance
  has_many :followers, through: :received_follows, source: :follower
end
