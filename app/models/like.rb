class Like < ApplicationRecord
  validates :tweet_id, :user_id, presence: true

  belongs_to :user
  belongs_to :tweet
end
