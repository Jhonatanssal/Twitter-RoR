class Tweet < ApplicationRecord
  validates :tweet, presence: true, length: { maximum: 300,
    too_long: '1000 characters in post is the maximum allowed.', minimum: 3 }
    
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
