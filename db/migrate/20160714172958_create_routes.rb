class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes, id: false do |t|
      t.primary_key :route_number

      t.timestamps
    end
  end
end
