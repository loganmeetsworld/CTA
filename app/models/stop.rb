class Stop < ApplicationRecord
  has_many :route_stops
  has_many :routes, through: :route_stops

  def self.search(term)
    where('LOWER(on_street) LIKE :term OR LOWER(cross_street) LIKE :term', term: "%#{term.downcase}%")
  end
end
