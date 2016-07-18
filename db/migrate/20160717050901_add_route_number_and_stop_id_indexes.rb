class AddRouteNumberAndStopIdIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :stops, :stop_id, unique: true
    add_index :routes, :route_number, unique: true
  end
end
