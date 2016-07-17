require 'csv'
require 'set'

def create_stops(stops)
  stops.each { |s| s[-1].gsub!(/[()]/, "") }
  stops_with_location = []
  stops.each do |s|
    stops_with_location.push(s[0..-2] + s[-1].split(', ').to_a)
  end

  columns = [:stop_id, :on_street, :cross_street, :routes, :boardings, :alightings, :month_beginning, :daytype, :latitude, :longitude]
  Stop.import(columns, stops_with_location, validate: false)
end

def create_routes(stops)
  route_set = Set.new
  route_columns = [:route_number]

  stops.each do |row|
    unless row[3].nil?
      row[3].split(',').each do |num|
        unless num == ''
          num.gsub!(' ','')
          route_set << [num]
        end
      end
    end
  end
  Route.import(route_columns, route_set.to_a, validate: false)
end

def create_route_stops(stops)
  route_stop_columns = [:stop_id, :route_id]
  route_stop_array = []

  stops.each do |row|
    if !row[3].nil?
      row[3].split(',').each do |num|
        if !num.empty?
          num.gsub!(' ','')
          route_stop_array.push([Stop.find_by(stop_id: row[0]).id, Route.find_by(route_number: num).id])
        end
      end
    end
  end
  RouteStop.import(route_stop_columns, route_stop_array, validate: false)
end

file = 'db/cta_ridership_data.csv'
stops = CSV.read(file).drop(1)
current = Time.now
create_stops(stops)
create_routes(stops)
create_route_stops(stops)
puts "Seeding took #{Time.now - current} seconds."