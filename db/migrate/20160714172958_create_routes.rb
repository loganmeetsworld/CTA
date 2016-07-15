class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :route_number

      t.timestamps
    end
    add_index :routes, :route_number
  end
end
