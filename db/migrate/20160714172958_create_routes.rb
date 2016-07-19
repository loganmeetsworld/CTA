class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes, id: false do |t|
      t.string :route_number, primary_key: true

      t.timestamps
    end
  end
end
