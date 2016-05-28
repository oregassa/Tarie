class User < ActiveRecord::Base
  has_many :items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 50},
	           uniqueness: {case_sensitive: false},
	           format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 3, maximum: 15}
end
