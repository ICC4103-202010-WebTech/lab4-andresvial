class EventVenue < ApplicationRecord
  validates :name, :address, presence: true
  validates :capacity, numericality: {greater_than_or_equal_to: 10, only_integer: true}
  has_many :events
end
