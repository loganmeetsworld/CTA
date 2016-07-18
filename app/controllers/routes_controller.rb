class RoutesController < ApplicationController
  def plot
    @route = Route.find_by(route_number: params[:route][:route_number])
    redirect_to route_path(@route.id)
  end

  def show
    @route = Route.find(params[:id])
    stops = Stop.includes(:routes).where(:routes => { route_number: @route.route_number}).all

    coordinates = stops.pluck(:latitude, :longitude, :boardings, :alightings, :on_street, :cross_street)
    gon.coordinates = coordinates
    gon.max_lat = stops.pluck(:latitude).max
    gon.min_lat = stops.pluck(:latitude).min
    gon.max_lon = stops.pluck(:longitude).max
    gon.min_lon = stops.pluck(:longitude).min
  end
end
