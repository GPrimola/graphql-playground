class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 10 }

  has_many :votes
  has_many :links
end
