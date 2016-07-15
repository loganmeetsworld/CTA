class StopsController < ApplicationController
  before_action :load_info 
  def index
    @stops = Stop.all
  end

  def map
  end

  def table
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
  end
end

