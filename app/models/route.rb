class Route < ApplicationRecord
  scope :max_stops, lambda {
    joins(:stops)
    .select("routes.*, count(stops.stop_id) as scount")
    .group("routes.route_number")
    .order("scount DESC")
    .first
  }

  has_many :route_stops
  has_many :stops, through: :route_stops
  validates :route_number, presence: true

  def calculate_coordinates(stops)
    coordinates = stops.pluck(:latitude, :longitude, :boardings, :alightings, :on_street, :cross_street)
  end
end
