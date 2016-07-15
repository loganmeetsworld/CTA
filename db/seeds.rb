require 'csv'
require 'date'

def create_stops(file)
  stops = CSV.read(file).drop(1)
  columns = [:stop_id, :on_street, :cross_street, :routes, :boardings, :alightings, :month_beginning, :daytype, :location]
  Stop.import columns, stops, validate: false
end

def create_routes(file)
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    unless row[:routes].nil?
      row[:routes].split(',').each do |route_number|
        unless route_number == ''
          route_number.gsub!(' ','')
          route = Route.where(route_number: route_number).first_or_create!
          RoutesStops.create!(stop_id: Stop.find_by(stop_id: row[0]).id, route_id: route.id)
        end
      end
    end
  end
end

file = 'db/cta_ridership_data.csv'
create_stops(file)
create_routes(file)