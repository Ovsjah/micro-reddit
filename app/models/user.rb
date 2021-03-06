class User < ApplicationRecord
  has_many :posts
  has_many :comments
  
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A.+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 }
end
