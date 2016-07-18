class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table "stops", id: false do |t|
      t.primary_key "stop_id"
      t.string      "on_street"
      t.string      "cross_street"
      t.integer     "boardings"
      t.integer     "alightings"
      t.string      "month_beginning"
      t.string      "daytype"
      t.decimal     "latitude", precision: 10, scale: 6
      t.decimal     "longitude", precision: 10, scale: 6
      t.string      "routes"
      t.timestamps
    end
  end
end
