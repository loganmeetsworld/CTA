class Stop < ApplicationRecord
  scope :max_routes, lambda {
    joins(:routes)
    .select('stops.*, count(routes.route_number) as rcount')
    .group('stops.stop_id')
    .order('rcount DESC')
    .first
  }

  scope :max_boardings, lambda {
    order('boardings DESC')
    .limit(1)
    .first
  }
  
  scope :min_boardings, lambda {
    order('boardings ASC')
    .limit(1)
    .first
  }
  
  scope :max_alightings, lambda {
    order('alightings DESC')
    .limit(1)
    .first
  }
  
  scope :min_alightings, lambda {
    order('alightings ASC')
    .limit(1)
    .first
  }

  has_many :route_stops
  has_many :routes, through: :route_stops

  def self.search(term)
    where('LOWER(on_street) LIKE :term OR LOWER(cross_street) LIKE :term', term: "%#{term.downcase}%")
  end

  def calculate_routes(routes, number_of_transfers)
    route_set = Set.new

    if number_of_transfers == "1"
      routes.each do |route|
        route_set << route
      end

      routes.each do |route|
        route.stops.each do |stop|
          stop.routes.each do |r|
            route_set << r
          end
        end
      end
      routes = route_set.to_a
    end
    return routes
  end

  def calculate_coordinates(routes)
    coordinates_array = []
    routes.each do |route|
      coordinates_array.push(route.stops.pluck(:latitude, :longitude, :boardings, :alightings, :on_street, :cross_street))
    end
    return coordinates_array
  end

  def find_coordinate_bounds(coordinates_array)
    max_lats, min_lats, max_lons, min_lons = [], [], [], []
    coordinates_array.each do |stop_array|
      max_lats << stop_array.max_by { |a| a[0] }[0]
      min_lats << stop_array.min_by { |a| a[0] }[0]
      max_lons << stop_array.max_by { |a| a[1] }[1]
      min_lons << stop_array.min_by { |a| a[1] }[1]
    end

    return max_lats, min_lats, max_lons, min_lons
  end
end
