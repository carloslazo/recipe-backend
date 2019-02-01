class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :first_name, :last_name, :password, :presence => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_many :pantry_items
  has_many :saved_recipes
  has_secure_password
end
