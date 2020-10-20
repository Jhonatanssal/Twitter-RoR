class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200,
                                                too_long: '200 characters in comment is the maximum.', minimum: 3 }
  validates :user, :tweet, presence: :true
  belongs_to :user
  belongs_to :tweet
end
