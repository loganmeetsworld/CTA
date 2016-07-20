class StopsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { @stops = Stop.search(params[:term]) }
    end
    @route_with_max_stops = Route.max_stops
    @stop_with_max_routes = Stop.max_routes
    @max_boardings = Stop.max_boardings
    @min_boardings = Stop.min_boardings
    @max_alightings = Stop.max_alightings
    @min_alightings = Stop.min_alightings
  end

  def plot
    stop = Stop.find_by(
      stop_id: params['stops-search-txt']
      .split(', ')[-1]
      .split(' ')[-1]
    )
    redirect_to stop_path(stop, transfer: params[:transfer])
  end

  def show
    @stop = Stop.find(params[:id])
    routes = @stop.calculate_routes(@stop.routes, params[:transfer])
    coordinates_array = @stop.calculate_coordinates(routes)
    coordinate_bounds = @stop.find_coordinate_bounds(coordinates_array)
 
    gon.stop = [
      @stop.latitude, @stop.longitude, @stop.on_street.titlecase, @stop.cross_street.titlecase
    ]
    gon.max_lat = coordinate_bounds[0].max
    gon.min_lat = coordinate_bounds[1].min
    gon.max_lon = coordinate_bounds[2].max
    gon.min_lon = coordinate_bounds[3].min
    gon.coordinates_array = coordinates_array
  end
end

