class Link < ApplicationRecord
  belongs_to :user

  has_many :votes, dependent: :destroy

  validates :url, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
end
