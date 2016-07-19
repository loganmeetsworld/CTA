class CreateStopsRoutesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :route_stops, id: false do |t|
      t.integer :stop_id
      t.string  :route_id

      t.timestamps
    end
  end
end
