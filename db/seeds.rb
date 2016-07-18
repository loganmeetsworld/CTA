require 'csv'

def create_stops(stops)
  stops.each { |s| s[-1].gsub!(/[()]/, "") }
  stops_with_location = []
  stops.each do |s|
    stops_with_location.push(s[0..-2] + s[-1].split(', ').to_a)
  end

  stop_columns = [:stop_id, :on_street, :cross_street, :routes, :boardings, :alightings, :month_beginning, :daytype, :latitude, :longitude]
  Stop.import(stop_columns, stops_with_location, validate: false)
end

def create_routes_and_route_stops(stops)
  route_set = Set.new
  route_stop_rows = []
  route_stop_columns = [:stop_id, :route_id]

  stops.each do |row|
    unless row[3].nil?
      row[3].split(',').each do |num|
        unless num == ''
          num.gsub!(' ','')
          route_set << Route.new(route_number: num)
          route_stop_rows << [row[0], num]
        end
      end
    end
  end
  Route.import route_set.to_a
  RouteStop.import(route_stop_columns, route_stop_rows, validate: false)
end

file = 'db/cta_ridership_data.csv'
stops = CSV.read(file).drop(1)
current = Time.now
create_stops(stops)
create_routes_and_route_stops(stops)
puts "Seeding took #{Time.now - current} seconds."