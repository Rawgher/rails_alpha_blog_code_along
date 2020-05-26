class User < ApplicationRecord
  # adding dependent so that if a user is deleted, all articles associated with them will be deleted
  has_many :articles, dependent: :destroy
  # Before anything is added to the db it sets the email to be all lowercase
  before_save { self.email = email.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
 # All caps variable name = constant
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
