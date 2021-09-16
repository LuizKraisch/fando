class User < ApplicationRecord
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, length: {maximum: 260}
  validates :password, presence: true, length: {minimum: 6}
  validates_length_of :first_name, :last_name, maximum: 255

  before_save { self.email = email.downcase }
end
