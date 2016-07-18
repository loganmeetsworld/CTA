class StopsController < ApplicationController
  before_action :load_info, except: [:table_data]
  def index
    respond_to do |format|
      format.html
      format.json { @stops = Stop.search(params[:term]) }
    end
  end

  def plot
    @stop = Stop.find_by(stop_id: params['stops-search-txt'].split(', ')[-1].split(' ')[-1])
    redirect_to stop_path(@stop, transfer: params[:transfer])
  end

  def show
    @stop = Stop.find(params[:id])
    routes = @stop.routes
    coordinates_array = []
    route_set = Set.new

    if params[:transfer] == "1"
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

    routes.each do |route|
      coordinates_array.push(route.stops.pluck(:latitude, :longitude, :boardings, :alightings, :on_street, :cross_street))
    end

    max_lats, min_lats, max_lons, min_lons = [], [], [], []
    coordinates_array.each do |stop_array|
      max_lats << stop_array.max_by { |a| a[0] }[0]
      min_lats << stop_array.min_by { |a| a[0] }[0]
      max_lons << stop_array.max_by { |a| a[1] }[1]
      min_lons << stop_array.min_by { |a| a[1] }[1]
    end
    gon.your_stop = [@stop.latitude, @stop.longitude, @stop.on_street.titlecase, @stop.cross_street.titlecase]
    gon.max_lat = max_lats.max
    gon.min_lat = min_lats.min
    gon.max_lon = max_lons.max
    gon.min_lon = min_lons.min

    gon.coordinates_array = coordinates_array
  end
  
  private
  def load_info
    @route_with_most_stops = 
      Route.joins(:stops)
        .select("routes.*, count(stops.id) as scount")
        .group("routes.id")
        .order("scount DESC")
        .first
    @stop_with_most_routes = 
      Stop.joins(:routes)
        .select("stops.*, count(routes.id) as scount")
        .group("stops.id")
        .order("scount DESC")
        .first

    @stop_with_most_boardings = Stop.order('boardings DESC').limit(1).first
    @stop_with_least_boardings = Stop.order('boardings ASC').limit(1).first
    @stop_with_most_alightings = Stop.order('alightings DESC').limit(1).first
    @stop_with_least_alightings = Stop.order('alightings ASC').limit(1).first
  end
end

