class Route < ApplicationRecord
  has_many :route_stops
  has_many :stops, through: :route_stops
  validates :route_number, presence: true

  scope :max_stops, lambda {
    joins(:stops)
    .select("routes.*, count(stops.id) as scount")
    .group("routes.id")
    .order("scount DESC")
    .first
  }
end
