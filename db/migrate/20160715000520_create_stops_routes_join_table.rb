class CreateStopsRoutesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :routes_stops, id: false do |t|
      t.references :stop, index: true
      t.references :route, index: true

      t.timestamps
    end
  end
end
