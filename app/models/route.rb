class Route < ApplicationRecord
  has_many :route_stops
  has_many :stops, through: :route_stops

  validates :route_number, presence: true, uniqueness: true
end
