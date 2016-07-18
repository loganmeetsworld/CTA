FactoryGirl.define do
  factory :stop do
    stop_id '1'
    on_street 'Main'
    cross_street 'Washington'
    boardings 20.2
    alightings 30.4
    month_beginning Date.current
    daytype 'Weekday'
    latitude 41.876322
    longitude -87.774105
  end

  factory :route do
    route_number '9'
  end

  factory :route_stop do
    stop_id  '1'
    route_id '9'
  end
end