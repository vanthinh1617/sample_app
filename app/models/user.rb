class User < ApplicationRecord
  attr_accessor :name, :email, :password, :password_confirmation
  has_secure_password
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: Setting.max_length_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Setting.max_length_email},
  format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Setting.max_length_password}
end
