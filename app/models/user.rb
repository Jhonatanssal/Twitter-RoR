class User < ApplicationRecord
  validates :username, :fullname , presence: true, length: { maximum: 20, minimum: 3 }

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
end
