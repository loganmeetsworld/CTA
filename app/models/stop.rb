class Stop < ApplicationRecord
  has_many :routes_stops
  has_many :routes, through: :routes_stops
end
