class Route < ApplicationRecord
  has_many :routes_stops
  has_many :stops, through: :routes_stops

  validates :route_number, presence: true
end
