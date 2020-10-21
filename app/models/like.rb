class Like < ApplicationRecord
  validates :tweet_id, :user_id, presence: true
  validates :tweet_id, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :tweet
end
