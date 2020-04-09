class Customer < ApplicationRecord
  validates :name, :lastname, presence: true
  validates :email, format: {with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
  has_many :orders
  has_many :tickets, through: :orders
end

